//
//  QuizViewController.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/20.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizView.h"
#import "QuizManager.h"
#import "FileHandler.h"
#import "ExplanationViewController.h"
#import "UIview+Toast.h"

@interface QuizViewController () {
    
    int correctQuizCount;
    QuizView *quizView;
    QuizManager *quizManager;
}
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初期化処理
    quizManager = [QuizManager sharedManager];
    [quizManager initQuizData];
    correctQuizCount = 0;
    
    // 問題データの取得
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"json"];
    quizManager.quizList = [FileHandler fetchQuizzesFromJsonFile:filePath];
    
    // ビューの準備
    quizView = [QuizView view];
    quizView.delegate = self;
    self.view = quizView;
    [quizView setupQuizText:[quizManager getCurrentQuiz]];
}

- (void)showResultAlertView {
    
    // 表示用メッセージ
    NSString *msg = [NSString stringWithFormat:@"%ld問中、%d問正解したので、正答率は%.1fです", quizManager.quizList.count, correctQuizCount, correctQuizCount / (double)quizManager.quizList.count];
    
    // アラートビューの作製
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"正答率" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"TOPに戻る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"解説を見る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        UITabBarController *tabVC = [[UITabBarController alloc] init];
        
        // タブバーに表示するビューコントローラ−の作製
        NSMutableArray *viewControllers = [NSMutableArray array];
        for (Quiz *quiz in quizManager.quizList) {
            
            ExplanationViewController *evc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ExplanationVC"];
            evc.quiz = quiz;
            [viewControllers addObject:evc];
            evc.title = [NSString stringWithFormat:@"第%ld問", viewControllers.count];
        }
        tabVC.viewControllers = viewControllers;
        
        // ナビゲーションバー戻るボタン
        UIBarButtonItem *leftNavBarItem = [[UIBarButtonItem alloc] initWithTitle:@"TOPに戻る" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popToRootViewControllerAnimated:)];
        tabVC.navigationItem.leftBarButtonItem = leftNavBarItem;
        
        [self.navigationController pushViewController:tabVC animated:YES];
    }]];
    
    // アラートビュー表示
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - QuizViewDelegate

- (void)didPushedChoiceButton:(UIButton *)button {

    if ([quizManager judgementCorrectAnswer:button.titleLabel.text]) {
        
        [self.view makeToast:@"正解"];
        correctQuizCount++;
    }else {
        [self.view makeToast:@"不正解"];
    }
    
    [quizManager hasNext] ?
        [quizView setupQuizText:[quizManager getNextQuiz]] :
        [self showResultAlertView];
}
@end
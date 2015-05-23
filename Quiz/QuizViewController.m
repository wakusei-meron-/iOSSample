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
#import "ExplanationTabViewController.h"
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
    NSString *msg = [NSString stringWithFormat:@"%ld問中、%d問正解したので、正答率は%.1f％です", quizManager.quizList.count, correctQuizCount, (correctQuizCount / (double)quizManager.quizList.count) * 100];
    
    // アラートビューの作製
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"正答率" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"TOPに戻る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:YES];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"解説を見る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        
        ExplanationTabViewController *tabVC = [[ExplanationTabViewController alloc] initWithQuizList:quizManager.quizList];
        [self.navigationController pushViewController:tabVC animated:YES];
    }]];
    
    // アラートビュー表示
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - QuizViewDelegate

- (void)didPushedChoiceButton:(UIButton *)button {

    if ([quizManager judgementCorrectAnswer:button.titleLabel.text]) {
        
        [self.view makeToast:@"正解" duration:1.0f position:self.view image:[UIImage imageNamed:@"maru"]];
        correctQuizCount++;
    }else {
        [self.view makeToast:@"不正解" duration:1.0f position:self.view image:[UIImage imageNamed:@"batu"]];
    }
    
    [quizManager hasNext] ?
        [quizView setupQuizText:[quizManager getNextQuiz]] :
        [self showResultAlertView];
}
@end
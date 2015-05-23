//
//  QuizViewController.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/20.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizViewController.h"
#import "QuizView.h"
#import "FileHandler.h"
#import "ExplanationTabBarViewController.h"
#import "ExplanationViewController.h"

@interface QuizViewController () {
    
    int currentQuizIndex;
    int correctQuizCount;
    NSArray *quizList;
    QuizView *quizView;
    
}
@property (weak, nonatomic) IBOutlet UIButton *choiceButton;

@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    quizView = [QuizView view];
    quizView.delegate = self;
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"txt"];
    quizList = [FileHandler fetchQuizzesFromTextFile:filePath];
    currentQuizIndex = 0;
    correctQuizCount = 0;
    [quizView setupQuizText:[quizList objectAtIndex:currentQuizIndex]];
    self.view = quizView;
}

#pragma mark - QuizViewDelegate

- (void)didPushedChoiceButton:(QuizChoiceButton *)button {

    Quiz *currentQuiz = [quizList objectAtIndex:currentQuizIndex];
    NSLog(@"%@, %@", button.titleLabel.text, currentQuiz.answer);
    if ([button.titleLabel.text isEqual:currentQuiz.answer]) {
        
        NSLog(@"正解");
        correctQuizCount++;
    }else {
        NSLog(@"不正解");
    }
    
    if (currentQuizIndex < (quizList.count - 1)) {
        
        currentQuizIndex++;
        Quiz *aQuiz = [quizList objectAtIndex:currentQuizIndex];
        NSLog(@"%@", aQuiz.quizText);
        [quizView setupQuizText:aQuiz];
    }else {
        
        NSString *msg = [NSString stringWithFormat:@"%lu問中、%d問正解したので、正答率は%.1fです", quizList.count, correctQuizCount, correctQuizCount / (double)quizList.count];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"正答率" message:msg preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"TOPに戻る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            [self.navigationController popViewControllerAnimated:YES];
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"解説を見る" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
//            [self.navigationController popViewControllerAnimated:NO];
            
            ExplanationTabBarViewController *etvc = [[ExplanationTabBarViewController alloc] init];//[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ExplanationTVC"];
            

            NSMutableArray *viewControllers = [NSMutableArray array];
            
            for (Quiz *quiz in quizList) {
                
                NSLog(@"iii");
                ExplanationViewController *evc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ExplanationVC"];
                evc.quiz = quiz;
                [viewControllers addObject:evc];
                evc.title = [NSString stringWithFormat:@"第%ld問", viewControllers.count];
            }
            etvc.viewControllers = viewControllers;
    
            [self.navigationController pushViewController:etvc animated:YES];
        }]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end























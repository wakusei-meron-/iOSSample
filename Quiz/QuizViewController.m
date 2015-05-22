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

@interface QuizViewController () {
    
    NSArray *quizList;
}
@property (weak, nonatomic) IBOutlet UIButton *choiceButton;

- (IBAction)didPushSelectedButton:(UIButton *)sender;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    QuizView *quizView = [QuizView view];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"question" ofType:@"txt"];
    quizList = [FileHandler fetchQuizzesFromTextFile:filePath];
    
    [quizView showQuizText:[quizList objectAtIndex:1]];
    self.view = quizView;
    
    
}

- (void)viewDidLayoutSubviews {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"hello" forState:UIControlStateNormal];
    CGRect frame = self.choiceButton.frame;
    NSLog(@"%@", NSStringFromCGRect(frame));
    frame.origin.y += 100;
    btn.frame = frame;
    [self.view addSubview:btn];
}

- (IBAction)didPushSelectedButton:(id)sender {
}
@end

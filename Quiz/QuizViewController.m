//
//  QuizViewController.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/20.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property (weak, nonatomic) IBOutlet UIButton *choiceButton;

- (IBAction)didPushSelectedButton:(UIButton *)sender;
@end

@implementation QuizViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

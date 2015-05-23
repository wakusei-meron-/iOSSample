//
//  HomeViewController.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/20.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "HomeViewController.h"
#import "QuizViewController.h"

@interface HomeViewController ()

- (IBAction)didPushGameStartButton:(id)sender;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgTile"]];
}

- (IBAction)didPushGameStartButton:(id)sender {
    NSString *className = NSStringFromClass([QuizViewController class]);
    QuizViewController *qvc = [self.storyboard instantiateViewControllerWithIdentifier:className];
    [self.navigationController pushViewController:qvc animated:YES];
}
@end

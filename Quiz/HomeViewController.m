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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPushGameStartButton:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    QuizViewController *qvc = [storyboard instantiateViewControllerWithIdentifier:@"QuizVC"];
    [self.navigationController pushViewController:qvc animated:YES];
}
@end

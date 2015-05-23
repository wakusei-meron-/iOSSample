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

- (IBAction)didPushGameStartButton:(id)sender {
    
    QuizViewController *qvc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"QuizVC"];
    [self.navigationController pushViewController:qvc animated:YES];
}
@end

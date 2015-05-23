//
//  ExplanationTabViewController.m
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/23.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "ExplanationTabViewController.h"
#import "ExplanationViewController.h"
#import "Quiz.h"

@implementation ExplanationTabViewController

- (instancetype)initWithQuizList:(NSArray *)quizList {
    
    self = [super init];
    if (self) {
        
        // タブバーに表示するビューコントローラ−の作製
        NSMutableArray *viewControllers = [NSMutableArray array];
        for (Quiz *quiz in quizList) {
            
            NSString *className = NSStringFromClass([ExplanationViewController class]);
            ExplanationViewController *evc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:className];
            evc.quiz = quiz;
            [viewControllers addObject:evc];
            evc.title = [NSString stringWithFormat:@"第%ld問", viewControllers.count];
        }
        self.viewControllers = viewControllers;
        
        // ナビゲーションバー戻るボタン
        UIBarButtonItem *leftNavBarItem = [[UIBarButtonItem alloc] initWithTitle:@"TOPに戻る" style:UIBarButtonItemStylePlain target:self.navigationController action:@selector(popToRootViewControllerAnimated:)];
        self.navigationItem.leftBarButtonItem = leftNavBarItem;
    }
    
    return self;
}

@end

//
//  ExplanationTabViewController.h
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/23.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplanationTabViewController : UITabBarController

/**
 *  quizListからExplanationViewControllerを生成して、Quizの内容をViewに反映させTabBarに格納して初期化
 *　また、戻るボタンでRootViewControllerに戻るように変更
 *
 *  @param quizList [Quiz, Quiz, ...]
 *
 *  @return ExplanationViewControllerを格納したTabBarController
 */
- (instancetype)initWithQuizList:(NSArray *)quizList;

@end

//
//  QuizView.h
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"

@protocol QuizViewDelegate;

@interface QuizView : UIView

@property (weak, nonatomic) IBOutlet UILabel *quizIndexLabel;
@property (nonatomic, assign) id<QuizViewDelegate> delegate;

/**
 *  NinファイルよりQuizViewを生成
 *
 *  @return QuizViewより生成したView
 */
+ (instancetype)view;

/**
 *  ViewのラベルにQuizの問題文と選択肢をセット
 *
 *  @param quiz 表示させたいQuiz
 */
- (void)setupQuizText:(Quiz *)quiz;

@end

@protocol QuizViewDelegate <NSObject>
- (void)didPushedChoiceButton:(UIButton *)button;
@end
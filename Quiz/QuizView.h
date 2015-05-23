//
//  QuizView.h
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"
//#import "QuizChoiceButton.h"

@protocol QuizViewDelegate;

@interface QuizView : UIView
//{
//    id<QuizViewDelegate> delegate; 
//}
@property (weak, nonatomic) IBOutlet UILabel *quizIndexLabel;
@property (nonatomic, assign) id<QuizViewDelegate> delegate;

+ (instancetype)view;
- (void)setupQuizText:(Quiz *)quiz;

@end

@protocol QuizViewDelegate <NSObject>

- (void)didPushedChoiceButton:(UIButton *)button;

@end
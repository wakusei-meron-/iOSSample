//
//  QuizView.h
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"

@interface QuizView : UIView

@property (weak, nonatomic) IBOutlet UILabel *quizIndexLabel;

+ (instancetype)view;
- (void)showQuizText:(Quiz *)quiz;

@end

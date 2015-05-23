//
//  QuizChoiceButton.h
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/22.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizChoiceButton : UIButton

+ (id)buttonWithType:(UIButtonType)buttonType title:(NSString *)title;
- (id)initWithTitle:(NSString *)title frame:(CGRect)frame;
- (id)initWithTitle:(NSString *)title;

@end

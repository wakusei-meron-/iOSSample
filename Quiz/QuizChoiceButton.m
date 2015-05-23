//
//  QuizChoiceButton.m
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/22.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizChoiceButton.h"
#import "UIScreen+Util.h"

@implementation QuizChoiceButton

+ (id)buttonWithType:(UIButtonType)buttonType title:(NSString *)title {
    
    UIButton *btn = [UIButton buttonWithType:buttonType];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    
    CGFloat defaultWidth, defaultHeight;
    defaultWidth = [UIScreen screenWidth];
    defaultHeight = [UIScreen screenHeight] / 10.0;
    
    CGRect btnFrame = CGRectZero;
    btnFrame.size.width = defaultWidth;
    btnFrame.size.height = defaultHeight;
    btn.frame = btnFrame;
    btn.center = [UIScreen screenCenter];
    
    NSLog(@"%@", NSStringFromCGRect([UIScreen bounds]));
    
    return btn;
}

- (id)initWithTitle:(NSString *)title frame:(CGRect)frame{
    
    self = [super init];
    if (self) {
        
        self.frame = frame;
        self.center = [UIScreen screenCenter];
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTintColor:[UIColor grayColor]];
    }
 
    return self;
}

- (id)initWithTitle:(NSString *)title {
    
    CGFloat defaultWidth, defaultHeight;
    defaultWidth = [UIScreen screenWidth];
    defaultHeight = [UIScreen screenHeight] / 10.0;
    
    CGRect btnFrame = CGRectZero;
    btnFrame.size.width = defaultWidth;
    btnFrame.size.height = defaultHeight;
    self = [self initWithTitle:title frame:[UIScreen bounds]];
    self.center = [UIScreen screenCenter];
    
    return self;
}

@end

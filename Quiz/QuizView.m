//
//  QuizView.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizView.h"

@interface QuizView()

@property (weak, nonatomic) IBOutlet UILabel *quizLabel;
@property (weak, nonatomic) IBOutlet UIButton *choiceButton;
@end

@implementation QuizView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

+ (instancetype)view {
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

- (void)showQuizText:(Quiz *)quiz {
 
    self.quizLabel.text = quiz.quizText;
    
    for (int i=0; i<quiz.choices.count; i++) {
        NSString *btnTitle = [quiz.choices objectAtIndex:i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        CGRect btnFlame = self.choiceButton.frame;
        btnFlame.origin.y += 50 * i;
        btn.frame = btnFlame;
        [btn setTitle:btnTitle forState:UIControlStateNormal];
        [self addSubview:btn];
        
        NSLog(@"%@", btnTitle);
    }
}

@end

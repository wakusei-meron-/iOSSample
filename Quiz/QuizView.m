//
//  QuizView.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizView.h"

@interface QuizView()
{
    NSArray *choiceButtonList;
}
@property (weak, nonatomic) IBOutlet UIButton *choiceButton1;
@property (weak, nonatomic) IBOutlet UIButton *choiceButton2;
@property (weak, nonatomic) IBOutlet UIButton *choiceButton3;
@property (weak, nonatomic) IBOutlet UIButton *choiceButton4;
@property (weak, nonatomic) IBOutlet UILabel *quizLabel;
- (IBAction)didPushedChoiceButton:(UIButton *)sender;
@end

@implementation QuizView

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    choiceButtonList = [NSArray arrayWithObjects: self.choiceButton1,
                                                  self.choiceButton2,
                                                  self.choiceButton3,
                                                  self.choiceButton4,
                        nil];
    
    for (UIButton *btn in choiceButtonList) {
        [btn.layer setBorderWidth:1.0];
        [btn.layer setCornerRadius:10.0];
    }
}

+ (instancetype)view {
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

- (void)setupQuizText:(Quiz *)quiz {
 
    [self drawRect:self.frame];
    self.quizLabel.text = quiz.quizText;
    
    for (int i=0; i<choiceButtonList.count; i++) {
        [[choiceButtonList objectAtIndex:i] setTitle:[quiz.choices objectAtIndex:i] forState:UIControlStateNormal];
    }
//    [self.choiceButton1 setTitle:[quiz.choices objectAtIndex:0] forState:UIControlStateNormal];
//    [self.choiceButton2 setTitle:[quiz.choices objectAtIndex:1] forState:UIControlStateNormal];
//    [self.choiceButton3 setTitle:[quiz.choices objectAtIndex:2] forState:UIControlStateNormal];
//    [self.choiceButton4 setTitle:[quiz.choices objectAtIndex:3] forState:UIControlStateNormal];
    
    for (int i=0 ;i<choiceButtonList.count ;i++) {
        NSString *choiceText = [quiz.choices objectAtIndex:i];
        UIButton *btn = [choiceButtonList objectAtIndex:i];
        [btn setTitle:choiceText forState:UIControlStateNormal];
    }
}

- (IBAction)didPushedChoiceButton:(UIButton *)sender {
    [self.delegate didPushedChoiceButton:sender];
}
@end

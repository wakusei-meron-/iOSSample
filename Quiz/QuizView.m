//
//  QuizView.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizView.h"

@interface QuizView() {
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

+ (instancetype)view {
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

- (void)drawRect:(CGRect)rect {
    
    choiceButtonList = [NSArray arrayWithObjects: self.choiceButton1,
                                                  self.choiceButton2,
                                                  self.choiceButton3,
                                                  self.choiceButton4,
                        nil];
    
    // ボタンの見た目調整
    for (UIButton *btn in choiceButtonList) {
        [btn.layer setBorderWidth:1.0];
        [btn.layer setCornerRadius:10.0];
    }
    
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgTile"]];
}

- (void)setupQuizText:(Quiz *)quiz {
 
    [self drawRect:self.frame];
    self.quizLabel.text = quiz.quizText;
    
    for (int i=0; i<choiceButtonList.count; i++) {
        [[choiceButtonList objectAtIndex:i] setTitle:[quiz.choices objectAtIndex:i] forState:UIControlStateNormal];
    }
}

- (IBAction)didPushedChoiceButton:(UIButton *)sender {
    [self.delegate didPushedChoiceButton:sender];
}
@end

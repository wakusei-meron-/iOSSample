//
//  QuizView.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizView.h"
#import "QuizChoiceButton.h"

@interface QuizView()
{
    NSMutableArray *choiceButtonList;
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

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)drawRect:(CGRect)rect {
    
//        choiceButtonList = [NSMutableArray array];
//    for (int i=0; i<4; i++) {
//        
//        QuizChoiceButton *btn = [QuizChoiceButton buttonWithType:UIButtonTypeRoundedRect title:@"aueo"];
//        CGRect btnFlame = self.choiceButton.frame;//btn.frame;
//        btnFlame.origin.y += 50 * i;
//        btn.frame = btnFlame;
//        [self addSubview:btn];
//        [btn addTarget:delegate action:@selector(didPushedChoiceButton:) forControlEvents:UIControlEventTouchUpInside];
//        [choiceButtonList addObject:btn];
//        [self.choiceButton removeFromSuperview];
//    }
//    
}

+ (instancetype)view {
    NSString *className = NSStringFromClass([self class]);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:0] firstObject];
}

- (void)setupQuizText:(Quiz *)quiz {
 
    self.quizLabel.text = quiz.quizText;
    
    [self.choiceButton1 setTitle:[quiz.choices objectAtIndex:0] forState:UIControlStateNormal];
    [self.choiceButton2 setTitle:[quiz.choices objectAtIndex:1] forState:UIControlStateNormal];
    [self.choiceButton3 setTitle:[quiz.choices objectAtIndex:2] forState:UIControlStateNormal];
    [self.choiceButton4 setTitle:[quiz.choices objectAtIndex:3] forState:UIControlStateNormal];
//    for (int i=0 ;i<choiceButtonList.count ;i++) {
//        NSString *choiceText = [quiz.choices objectAtIndex:i];
//        QuizChoiceButton *btn = [choiceButtonList objectAtIndex:i];
//        [btn setTitle:choiceText forState:UIControlStateNormal];
//    }
//    for (int i=0; i<quiz.choices.count; i++) {
//        NSString *btnTitle = [quiz.choices objectAtIndex:i];
//        QuizChoiceButton *btn = [QuizChoiceButton buttonWithType:UIButtonTypeRoundedRect title:btnTitle];
//        CGRect btnFlame = self.choiceButton.frame;//btn.frame;
//        btnFlame.origin.y += 50 * i;
//        btn.frame = btnFlame;
//        [self addSubview:btn];
//        
//        
//        [btn addTarget:delegate action:@selector(didPushedChoiceButton:) forControlEvents:UIControlEventTouchUpInside];
//        
//        NSLog(@"%@", btnTitle);
//    }
}
- (IBAction)didPushedChoiceButton:(UIButton *)sender {
    
    NSLog(@"push");
    [self.delegate didPushedChoiceButton:(QuizChoiceButton *)sender];
}
@end

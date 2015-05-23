//
//  ExplanationViewController.m
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/23.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "ExplanationViewController.h"

@interface ExplanationViewController ()

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *quizTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *explanationLabel;
@end

@implementation ExplanationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.indexLabel.text = self.title;
    [self setupLabelWithQuiz:self.quiz];
}


- (void)setupLabelWithQuiz:(Quiz *)quiz {

    self.quizTextLabel.text = quiz.quizText;
    self.answerLabel.text = quiz.answer;
    self.explanationLabel.text = quiz.explanation;
}

@end

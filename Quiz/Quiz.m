//
//  Quiz.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

- (id)initWithQuizOf:(NSString *)quiz answer:(NSString *)anser explanation:(NSString *)explanation choices:(NSArray *)choices {
    
    self = [super init];
    if (self) {
        self.quizText = quiz;
        self.answer = anser;
        self.explanation = explanation;
        self.choices = choices;
    }
    return self;
}

@end

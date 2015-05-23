//
//  QuizManager.m
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/23.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "QuizManager.h"

@implementation QuizManager {
    int currentQuizIndex;
}

static QuizManager *sharedManager = nil;

+ (QuizManager *)sharedManager {
    
    @synchronized(self) {
        if (!sharedManager) {
            sharedManager = [[super alloc] init];
        }
    }
    
    return sharedManager;
}

- (void)initQuizData {
    currentQuizIndex = 0;
    self.quizList = [NSArray array];
}

- (BOOL)hasNext {
    return (currentQuizIndex + 1 < self.quizList.count) ? true : false;
}

- (Quiz *)getNextQuiz {
    currentQuizIndex++;
    return [self.quizList objectAtIndex:currentQuizIndex];
}

- (Quiz *)getCurrentQuiz {
    return [self.quizList objectAtIndex:currentQuizIndex];
}

- (BOOL)judgementCorrectAnswer:(NSString *)selectedAnswer {
    return [selectedAnswer isEqualToString:[self getCurrentQuiz].answer];
}

@end

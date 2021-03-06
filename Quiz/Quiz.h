//
//  Quiz.h
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

- (id)initWithQuizOf:(NSString *)quiz
              answer:(NSString *)anser
         explanation:(NSString *)explanation
             choices:(NSArray *)choices;

@property(nonatomic, strong) NSString *quizText;
@property(nonatomic, strong) NSString *answer;
@property(nonatomic, strong) NSString *explanation;
@property(nonatomic, strong) NSArray  *choices;

@end

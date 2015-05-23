//
//  FileHandler.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "FileHandler.h"
#import "Quiz.h"

@implementation FileHandler

const NSString *kQuizKey = @"quiz";
const NSString *kAnswerKey = @"answer";
const NSString *kExplanationKey = @"commentary";
const NSString *kChoicesKey = @"choices";

+ (NSArray *)fetchQuizzesFromJsonFile:(NSString *)filePath {
    
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"error: %@", error.description);
        return @[];
    }

    NSMutableArray *quizList = [NSMutableArray array];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *jsonArray = [[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error] objectForKey:@"quizzes"];

    for (NSDictionary *json in jsonArray) {
        Quiz *aQuiz = [[Quiz alloc] initWithQuizOf:[json objectForKey:kQuizKey]
                                            answer:[json objectForKey:kAnswerKey]
                                       explanation:[json objectForKey:kExplanationKey]
                                           choices:[json objectForKey:kChoicesKey]
                       ];
        [quizList addObject:aQuiz];
    }
    
    return quizList;
}

@end

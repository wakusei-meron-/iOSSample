//
//  FileHandler.h
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/21.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHandler : NSObject

+ (NSArray *)fetchQuizzesFromJsonFile:(NSString *)filePath;

@end

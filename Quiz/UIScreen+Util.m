//
//  UIScreen+Util.m
//  Quiz
//
//  Created by 石橋 弦樹 on 2015/05/22.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import "UIScreen+Util.h"

@implementation UIScreen(Util)

+ (CGRect)bounds {
//    NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    return screenRect;
}

+ (CGFloat)screenWidth {
    return [self bounds].size.width;
}

+ (CGFloat)screenHeight {
    return [self bounds].size.height;
}

+ (CGPoint)screenCenter {
    
    CGPoint center = CGPointMake([self bounds].size.width  / 2.0,
                                 [self bounds].size.height / 2.0);
    return center;
}

@end

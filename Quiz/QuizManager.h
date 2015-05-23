//
//  QuizManager.h
//  Quiz
//
//  Created by Genki Ishibashi on 2015/05/23.
//  Copyright (c) 2015年 石橋 弦樹. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quiz.h"

@interface QuizManager : NSObject

@property (nonatomic, strong) NSArray *quizList;

/**
 *  シングルトンのインスタンスの取得
 */
+ (QuizManager *)sharedManager;


/**
 *  currentQuizIndex, correctQuizCount, quizListの初期化
 */
- (void)initQuizData;


/**
 *  quizListの次の値が存在するかの判定
 *
 *  @return 存在すればtrue, そうでなければfalse
 */
- (BOOL)hasNext;


/**
 *  インデックスを１つ増やしQuizの取得
 *
 *  @return 次のインデックスのQuiz
 */
- (Quiz *)getNextQuiz;


/**
 *  現在のインデックスのQuizの取得
 *
 *  @return 現在のインデックスのQuiz
 */
- (Quiz *)getCurrentQuiz;


/**
 *  問題があっているかどうかの判定
 *
 *  @param selectedAnswer 選択した答えの文字列
 *
 *  @return 合っていればtrue, 間違っていればfalse
 */
- (BOOL)judgementCorrectAnswer:(NSString *)selectedAnswer;

@end

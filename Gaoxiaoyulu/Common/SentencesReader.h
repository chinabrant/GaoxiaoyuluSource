//
//  SentencesReader.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-28.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SentencesReaderDelegate <NSObject>

- (void)didFinishReaderSentences:(NSArray *)sentences;

@end

@interface SentencesReader : NSObject

@property (nonatomic, assign) id <SentencesReaderDelegate> delegate;

- (void)readSentencesWithPage:(int)page;

@end

//
//  Sentence.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "Sentence.h"

@implementation Sentence

- (void)print {
    NSLog(@"[Sentence ==> id: %d  content: %@  time: %@  author: %@]", self.sentenceId, self.content, self.time, self.author);
}

@end

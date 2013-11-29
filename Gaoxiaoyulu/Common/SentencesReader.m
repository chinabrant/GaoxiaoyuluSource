//
//  SentencesReader.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-28.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "SentencesReader.h"
#import "Sentence.h"
// 一次读取多少条数据
#define Page_Size 10

@implementation SentencesReader

/*
 * 分页读取，page从1开始
 */
- (void)readSentencesWithPage:(int)page {
    NSLog(@"开始查找数据 page : %d", page);
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"yulu"];
    [bquery orderByDescending:@"createdAt"];
    [bquery setSkip:page];
    [bquery setLimit:Page_Size];
    
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, BOOL isSuccessful) {
        NSLog(@"back");
        if (isSuccessful) {
            NSLog(@"读取成功 count : %d", array.count);
            NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
            for (BmobObject *obj in array) {
                Sentence *s = [[Sentence alloc] init];
                s.objectId = obj.objectId;
                s.content = [obj objectForKey:@"content"];
                s.time = [obj objectForKey:@"createdAt"];
                s.author = [obj objectForKey:@"author"];
                [arr addObject:s];
            }
            
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishReaderSentences:)]) {
                [self.delegate didFinishReaderSentences:arr];
            }
        } else {
            NSLog(@"读取失败...");
            if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishReaderSentences:)]) {
                [self.delegate didFinishReaderSentences:nil];
            }
        }
    }];
}

@end

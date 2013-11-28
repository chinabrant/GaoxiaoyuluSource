//
//  Sentence.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//  一条语句

/*
 {
 "id": 		1,
 "content":	"对不起，你拨打的用户已结婚",
 "time": 	"2013-11-27",
 "author":	"brant"
 }
 */

#import <Foundation/Foundation.h>

@interface Sentence : NSObject

@property (nonatomic, assign) NSInteger sentenceId;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *objectId;

- (void)print;

@end

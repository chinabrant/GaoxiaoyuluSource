//
//  JsonParser.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonParser : NSObject

+ (NSArray *)parserItems:(NSString *)jsonString;
+ (NSArray *)parserSentences:(NSString *)jsonString;

@end

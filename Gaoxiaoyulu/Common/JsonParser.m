//
//  JsonParser.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "JsonParser.h"
#import "Item.h"
#import "Sentence.h"

@implementation JsonParser

+ (NSArray *)parserItems:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSArray *items = [dic valueForKey:@"items"];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < items.count; i++) {
        NSDictionary *d = [items objectAtIndex:i];
        Item *item = [[Item alloc] init];
        item.name = [d valueForKey:@"name"];
        item.time = [d valueForKey:@"time"];
        item.number = [[d valueForKey:@"number"] intValue];
//        [item print];
        [arr addObject:item];
    }
    
    return arr;
}

+ (NSArray *)parserSentences:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil];
    NSArray *items = [dic valueForKey:@"sentences"];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (int i = 0; i < items.count; i++) {
        NSDictionary *d = [items objectAtIndex:i];
        Sentence *sentence = [[Sentence alloc] init];
        sentence.content = [d valueForKey:@"content"];
        sentence.time = [d valueForKey:@"time"];
        sentence.author = [d valueForKey:@"author"];
        sentence.sentenceId = [[d valueForKey:@"id"] integerValue];
//        [sentence print];
        [arr addObject:sentence];
    }
    
    return arr;
}

@end

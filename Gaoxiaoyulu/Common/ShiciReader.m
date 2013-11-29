//
//  ShiciReader.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "ShiciReader.h"

#define PageSize 10

@implementation ShiciReader

- (void)readShiciWithPage:(int)page {
    NSLog(@"开始查找诗词 page : %d", page);
    BmobQuery   *bquery = [BmobQuery queryWithClassName:@"shici"];
    [bquery orderByDescending:@"createdAt"];
    [bquery setSkip:page];
    [bquery setLimit:PageSize];
    [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, BOOL isSuccessful) {
        NSLog(@"back");
        if (isSuccessful) {
            NSLog(@"读取成功 count : %d", array.count);
//            NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
            for (BmobObject *obj in array) {
                Shici *sc = [[Shici alloc] init];
                sc.content = [obj objectForKey:Shici_Content];
                sc.poet = [obj objectForKey:Shici_Poet];
                sc.poem = [obj objectForKey:Shici_Poem];
                sc.message = [obj objectForKey:Shici_Message];
                sc.createdAt = [obj objectForKey:Shici_CreatedAt];
                [sc print];
            }
        }
    }];
}

@end

//
//  Item.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, assign) int number;

- (void)print;

@end

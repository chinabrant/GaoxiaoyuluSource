//
//  Shici.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Shici_Content @"content"
#define Shici_Poet @"poet"
#define Shici_Poem @"poem"
#define Shici_Message @"message"
#define Shici_CreatedAt @"createdAt"

@interface Shici : NSObject

@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *poet;
@property (nonatomic, copy) NSString *poem;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *createdAt;

- (void)print;

@end

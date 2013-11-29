//
//  ShiciReader.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shici.h"

@protocol ShiciReaderDelegate <NSObject>

- (void)didFinishReadShici:(NSArray *)scs;

@end

@interface ShiciReader : NSObject

@property (nonatomic, assign) id<ShiciReaderDelegate> delegate;

- (void)readShiciWithPage:(int)page;

@end

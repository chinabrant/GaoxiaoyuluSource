//
//  NetRequest.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "Item.h"

#define URL_PREFIX @"https://raw.github.com/chinabrant/gaoxiaoyulu/master/"

typedef NS_ENUM(NSInteger, RequestType) {
    RequestTypeItems,
    RequestTypeSentences
};

@protocol NetRequestDelegate <NSObject>

@optional
- (void)didFinishGetItems:(NSArray *)items;
- (void)didFinishGetSentences:(NSArray *)sents;
- (void)didFailedRequestItems;
- (void)didFailedRequestSentences;

@end

@interface NetRequest : NSObject <ASIHTTPRequestDelegate> {
    ASIHTTPRequest *http;
    RequestType type;
}

@property (nonatomic, assign) id <NetRequestDelegate> delegate;

- (void)requestItems;
- (void)requestSentenceWithItem:(Item *)item;

@end

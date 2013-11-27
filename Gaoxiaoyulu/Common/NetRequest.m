//
//  NetRequest.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "NetRequest.h"
#import "JsonParser.h"
#import "Item.h"

@implementation NetRequest

- (void)requestItems {
    type = RequestTypeItems;
    NSLog(@"开始请求 items");
    if (http) {
        [http cancel];
        http.delegate = nil;
        http = nil;
    }
    
    http = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@dir.json", URL_PREFIX]]];
    http.delegate = self;
    [http startAsynchronous];
}

- (void)requestSentenceWithItem:(Item *)item {
    type = RequestTypeSentences;
    if (http) {
        [http cancel];
        http.delegate = nil;
        http = nil;
    }
    
    http = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", URL_PREFIX, item.name]]];
    http.delegate = self;
    [http startAsynchronous];
}

#pragma mark - ASIHTTPRequestDelegate
- (void)requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"request : %@", request.responseString);
    if (type == RequestTypeItems) {
        NSArray *items = [JsonParser parserItems:request.responseString];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishGetItems:)]) {
            [self.delegate didFinishGetItems:items];
        }
        [self requestSentenceWithItem:[items objectAtIndex:0]];
    } else {
        NSArray *sentences = [JsonParser parserSentences:request.responseString];
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFinishGetSentences:)]) {
            [self.delegate didFinishGetSentences:sentences];
        }
    }
    
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"requestFailed");
    if (type == RequestTypeItems) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailedRequestItems)]) {
            [self.delegate didFailedRequestItems];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(didFailedRequestSentences)]) {
            [self.delegate didFailedRequestSentences];
        }
    }
}

@end

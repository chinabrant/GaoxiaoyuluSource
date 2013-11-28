//
//  RootViewController.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NetRequest.h"
#import "SentenceCell.h"
#import "DetailViewController.h"
#import "SVPullToRefresh.h"
#import "SettingsViewController.h"
#import "SentencesReader.h"

@interface RootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SentencesReaderDelegate> {
//    NetRequest *request;
    __weak IBOutlet UITableView *mTableView;
    NSMutableArray *sentences;
    NSMutableArray *items;
    BOOL isLoadingMore;
    SentencesReader *sentencesReader;
    int currentPage;
}

@end

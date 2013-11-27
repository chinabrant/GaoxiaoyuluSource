//
//  RootViewController.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetRequest.h"
#import "SentenceCell.h"
#import "DetailViewController.h"
#import "SVPullToRefresh.h"
#import "SettingsViewController.h"

@interface RootViewController : UIViewController <NetRequestDelegate, UITableViewDataSource, UITableViewDelegate> {
    NetRequest *request;
    __weak IBOutlet UITableView *mTableView;
    NSMutableArray *sentences;
    NSMutableArray *items;
    BOOL isLoadingMore;
}

@end

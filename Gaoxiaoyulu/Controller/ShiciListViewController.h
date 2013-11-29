//
//  ShiciListViewController.h
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "ShiciReader.h"
#import "ShiciListCell.h"

@interface ShiciListViewController : BaseViewController <UITableViewDataSource, UITableViewDelegate, ShiciReaderDelegate> {
    NSMutableArray *shiciArray;
    UITableView *shiciTableView;
}

@end

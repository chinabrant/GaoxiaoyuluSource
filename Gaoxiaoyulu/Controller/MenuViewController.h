//
//  MenuViewController.h
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "BaseViewController.h"

@interface MenuViewController : UINavigationController <UITableViewDataSource, UITableViewDelegate> {
    NSArray *dataArray;
}

@end

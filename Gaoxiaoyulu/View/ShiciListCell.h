//
//  ShiciListCell.h
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Shici.h"

@interface ShiciListCell : UITableViewCell {
    UILabel *contentLabel;
    UILabel *poetLabel;
}

- (void)bindData:(Shici *)sc;

@end

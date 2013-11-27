//
//  SentenceCell.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sentence.h"

@interface SentenceCell : UITableViewCell {
    UILabel *contentLabel;
    UILabel *timeLabel;
    UILabel *authorLabel;
    Sentence *sen;
}

- (void)bindData:(Sentence *)sentence;

@end

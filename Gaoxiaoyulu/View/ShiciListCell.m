//
//  ShiciListCell.m
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "ShiciListCell.h"

@implementation ShiciListCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupViews {
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 30)];
    [self.contentView addSubview:contentLabel];
    
    poetLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 40, 145, 20)];
    poetLabel.textAlignment = NSTextAlignmentRight;
    poetLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:poetLabel];
}

- (void)bindData:(Shici *)sc {
    contentLabel.text = sc.content;
    poetLabel.text = sc.poet;
}

@end

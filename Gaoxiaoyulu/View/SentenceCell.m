//
//  SentenceCell.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "SentenceCell.h"

@implementation SentenceCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 300, 30)];
    [self.contentView addSubview:contentLabel];
    
    timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 40, 145, 20)];
    timeLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:timeLabel];
    
    authorLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 40, 145, 20)];
    authorLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:authorLabel];
}

- (void)bindData:(Sentence *)sentence {
    sen = sentence;
    contentLabel.text = [NSString stringWithFormat:@"%@", sentence.content];
    timeLabel.text = sen.time;
    authorLabel.text = [NSString  stringWithFormat:@"来自:%@", sen.author];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

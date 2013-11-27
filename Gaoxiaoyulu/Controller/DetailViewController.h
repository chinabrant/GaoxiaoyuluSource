//
//  DetailViewController.h
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "Sentence.h"

@interface DetailViewController : BaseViewController {
    Sentence *sentence;
}

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;

- (id)initWithSentences:(Sentence *)sen;

@end

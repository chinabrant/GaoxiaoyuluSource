//
//  ShiciDetailViewController.h
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "BaseViewController.h"
#import "Shici.h"

@interface ShiciDetailViewController : BaseViewController {
    Shici *shici;
}

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *poemLabel;

- (id)initWithShici:(Shici *)sc;

@end

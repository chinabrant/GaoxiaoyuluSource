//
//  ShiciDetailViewController.m
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "ShiciDetailViewController.h"


@interface ShiciDetailViewController ()

@end

@implementation ShiciDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithShici:(Shici *)sc {
    self = [super init];
    if (self) {
        shici = sc;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.contentLabel.text = shici.content;
    self.poemLabel.text = shici.poem;
    self.authorLabel.text = shici.poet;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

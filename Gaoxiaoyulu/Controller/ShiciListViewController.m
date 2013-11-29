//
//  ShiciListViewController.m
//  Gaoxiaoyulu
//
//  Created by 吴述军 on 13-11-29.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "ShiciListViewController.h"
#import "ShiciDetailViewController.h"

@interface ShiciListViewController ()

@end

@implementation ShiciListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        shiciArray = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"诗词名句";
    
    shiciTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height) style:UITableViewStylePlain];
    shiciTableView.dataSource = self;
    shiciTableView.delegate = self;
    [self.view addSubview:shiciTableView];

    ShiciReader *scReader = [[ShiciReader alloc] init];
    scReader.delegate = self;
    [scReader readShiciWithPage:1];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [shiciArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"Cell";
    ShiciListCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[ShiciListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    [cell bindData:[shiciArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ShiciDetailViewController *scVC = [[ShiciDetailViewController alloc] initWithShici:[shiciArray objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:scVC animated:YES];
}

# pragma mark - ShiciReaderDelegate
- (void)didFinishReadShici:(NSArray *)scs {
    if (scs == nil) {
        return;
    }
    
    [shiciArray addObjectsFromArray:scs];
    [shiciTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

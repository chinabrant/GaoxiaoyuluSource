//
//  RootViewController.m
//  Gaoxiaoyulu
//
//  Created by wusj on 13-11-27.
//  Copyright (c) 2013年 brant. All rights reserved.
//

#import "RootViewController.h"
#import "JsonParser.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        items = [[NSMutableArray alloc] initWithCapacity:0];
        sentences = [[NSMutableArray alloc] initWithCapacity:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(clickSettings:)];
    self.navigationItem.rightBarButtonItem = settingsItem;

    self.title = @"语录列表";
    mTableView.delegate = self;
    mTableView.dataSource = self;
    
    [mTableView addPullToRefreshWithActionHandler:^{
        [self requestSentences];
        isLoadingMore = YES;
    } position:SVPullToRefreshPositionBottom];
    
    request = [[NetRequest alloc] init];
    request.delegate = self;
    [request requestItems];
}

- (void)requestSentences {
    if (request == nil) {
        request = [[NetRequest alloc] init];
        request.delegate = self;
    }
    
    [request requestSentenceWithItem:[items objectAtIndex:1]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sentences.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *Identifier = @"cell";
    SentenceCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell == nil) {
        cell = [[SentenceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
    }
    
    [cell bindData:[sentences objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *de = [[DetailViewController alloc] initWithSentences:[sentences objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:de animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NetRequestDelegate
- (void)didFinishGetItems:(NSArray *)items1 {
    [items addObjectsFromArray:items1];
}

- (void)didFinishGetSentences:(NSArray *)sents {
    if (sents) {
        [sentences addObjectsFromArray:sents];
        if (isLoadingMore) {
            isLoadingMore = NO;
            [mTableView.pullToRefreshView stopAnimating];
        }
    } else {
        NSLog(@"sentences is nil");
    }
    
    [mTableView reloadData];
}

- (void)didFailedRequestItems {
    
}

- (void)didFailedRequestSentences {
    if (isLoadingMore) {
        isLoadingMore = NO;
        [mTableView.pullToRefreshView stopAnimating];
    }
}

- (void)clickSettings:(id)sender {
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settings animated:YES];
}

@end

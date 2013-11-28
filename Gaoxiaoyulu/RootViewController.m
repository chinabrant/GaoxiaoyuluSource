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
        currentPage = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *settingsItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(clickSettings:)];
    self.navigationItem.rightBarButtonItem = settingsItem;

    self.title = @"语录列表";
    mTableView.delegate = self;
    mTableView.dataSource = self;
    
    [mTableView addPullToRefreshWithActionHandler:^{
        [self readSentences];
        isLoadingMore = YES;
    } position:SVPullToRefreshPositionBottom];
    
    [self readSentences];
}

- (void)readSentences {
    sentencesReader = [[SentencesReader alloc] init];
    sentencesReader.delegate = self;
    [sentencesReader readSentencesWithPage:currentPage];
}

#pragma mark - SentencesReaderDelegate
- (void)didFinishReaderSentences:(NSArray *)sents {
    if (isLoadingMore) {
        isLoadingMore = NO;
        [mTableView.pullToRefreshView stopAnimating];
    }
    
    if (sents == nil) {
        return;
    }

    [sentences addObjectsFromArray:sents];
    [mTableView reloadData];
    currentPage++;
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

- (void)clickSettings:(id)sender {
    SettingsViewController *settings = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settings animated:YES];
}

@end

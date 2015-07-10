//
//  WatchList.m
//  DataModel
//
//  Created by Travis Delly on 7/8/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "WatchList.h"
#import "StaticCell.h"
#import "AppDelegate.h"
#import "CustomGUI.h"
#import "ShowCaseTableView.h"

@interface WatchList ()

@property AppDelegate *sharedDelegate;
@property CustomGUI *customGUI;

@end

@implementation WatchList

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    _customGUI = [[CustomGUI alloc] init];
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sharedDelegate.userWatchList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StaticCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[StaticCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor darkGrayColor];
    } else {
        cell.backgroundColor = [UIColor grayColor];
    }
    
    if(indexPath.row % 3 == 0){
        cell.state.text = @"HOT!";
        cell.state.textColor = [UIColor redColor];
    } else {
        cell.state.text = @"RISK!";
        cell.state.textColor = [UIColor orangeColor];
    }
    cell.companyForCell = [[Company alloc] initWithDict:[_sharedDelegate.userWatchList objectAtIndex:indexPath.row]];
    cell.textLabel.text = cell.companyForCell.StockLOGO;
    cell.detailTextLabel.text = cell.companyForCell.StockExchange;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StaticCell *cell = (StaticCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    NSMutableArray *data = [_sharedDelegate.helper find_companyTOPTEN:cell.companyForCell.StockExchange for:cell.companyForCell.StockLOGO startDate:cell.companyForCell.startDate endDate:cell.companyForCell.endDate];
    
    ShowCaseTableView *showPage = [[ShowCaseTableView alloc] init];
    showPage.nameOfCompany = cell.companyForCell.StockLOGO;
    showPage.data = data;
    
    [_sharedDelegate.navController pushViewController:showPage animated:YES];
    
}

//Setup

-(void)setup{
    //Header and stuff
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    _header = [_customGUI defaultLabel:@"Watch List"];
    _header.textColor = [UIColor whiteColor];
    _header.frame = CGRectMake(0, 10, self.view.frame.size.width, 35);
    _header.adjustsFontSizeToFitWidth = YES;
    
    headerView.backgroundColor = [UIColor blackColor];
    [headerView addSubview:_header];
    self.tableView.tableHeaderView = headerView;
    
}

@end

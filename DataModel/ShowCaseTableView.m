//
//  ShowCaseTableView.m
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "ShowCaseTableView.h"
#import "AppDelegate.h"
#import "CustomGUI.h"
#import "StaticCell.h"
#import "DescriptionForRowPage.h"

@interface ShowCaseTableView ()
@property AppDelegate *sharedDelegate;
@property CustomGUI *customGUI;
@property (strong, nonatomic) UISearchController *searchController;

@end

@implementation ShowCaseTableView{
}
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _ShownData = (NSMutableArray*)_theData;
    
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    _customGUI = [[CustomGUI alloc] init];
    _meaningforRow = [[NSMutableArray alloc] init];
    
    for (int x = 0; x < 13; x++) {
        [_meaningforRow addObject:@"Unavailable right now"];
    }
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return _ShownData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_ShownData objectAtIndex:section] count]-1;
}
-(void)setup{
    
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater = self;
    [self.searchController.searchBar sizeToFit];
    self.searchController.searchBar.placeholder = @"Search by date";
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
}
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString *searchString = searchController.searchBar.text;
    
    if(searchString.length != 0){
        _ShownData = [[NSMutableArray alloc] init];
        for (int x = 0; x < _theData.count; x++) {
            if([[[_theData objectAtIndex:x] objectAtIndex:0] containsString:searchString]){
                [_ShownData addObject:[_theData objectAtIndex:x]];
            }
        }
    } else {
        _ShownData = (NSMutableArray*)_theData;
    }
    [self.tableView reloadData];
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[_ShownData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row+1]];
    cell.meaningForRow = [_meaningforRow objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StaticCell *cell = (StaticCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    DescriptionForRowPage *descriptionPage =[[DescriptionForRowPage alloc] init];
    
    descriptionPage.meaning = [_customGUI defaultLabel:cell.meaningForRow];
    
    [_sharedDelegate.navController pushViewController:descriptionPage animated:YES];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [[_ShownData objectAtIndex:section] objectAtIndex:0];
}

@end

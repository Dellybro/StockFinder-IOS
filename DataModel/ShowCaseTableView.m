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

@end

@implementation ShowCaseTableView{
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_data objectAtIndex:section] count]-1;
}
-(void)setup{
    //Header and stuff
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    _header = [_customGUI defaultLabel:_nameOfCompany];
    _header.textColor = [UIColor whiteColor];
    _header.frame = CGRectMake(0, 10, self.view.frame.size.width, 35);
    _header.adjustsFontSizeToFitWidth = YES;
    
    headerView.backgroundColor = [UIColor blackColor];
    [headerView addSubview:_header];
    self.tableView.tableHeaderView = headerView;
    
    
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
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",[[_data objectAtIndex:indexPath.section] objectAtIndex:indexPath.row+1]];
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
    return [[_data objectAtIndex:section] objectAtIndex:0];
}

@end

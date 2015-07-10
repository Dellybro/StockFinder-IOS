//
//  TopRated.m
//  DataModel
//
//  Created by Travis Delly on 7/6/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "CustomGUI.h"
#import "AppDelegate.h"
#import "TopRated.h"
#import "SearchPage.h"
#import "ShowCaseTableView.h"
#import "StaticCell.h"
#import "WatchList.h"

@interface TopRated ()

@property AppDelegate *sharedDelegate;
@property CustomGUI *customGUI;

@end

@implementation TopRated

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _customGUI = [[CustomGUI alloc] init];
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    
    [self setup];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _sharedDelegate.topTen.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StaticCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        
        cell = [[StaticCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
    }
    
    
    //cell.CompanyName = [_sharedDelegate.topTenNames objectAtIndex:indexPath.row];
    cell.CompanyDetails = [_sharedDelegate.topTen objectAtIndex:indexPath.row];
    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor darkGrayColor];
    } else {
        cell.backgroundColor = [UIColor grayColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@, Date: %@", [_sharedDelegate.topTenNames objectAtIndex:indexPath.row], [[[_sharedDelegate.topTen objectAtIndex:indexPath.row] objectAtIndex:0] objectAtIndex:0]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"High: %@", [[[_sharedDelegate.topTen objectAtIndex:indexPath.row] objectAtIndex:0]objectAtIndex:1]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    StaticCell *cell = (StaticCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    ShowCaseTableView *page = [[ShowCaseTableView alloc] init];
    page.theData = cell.CompanyDetails;
    page.nameOfCompany = [_sharedDelegate.topTenNames objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:page animated:YES];
    
}
-(void)setup{
    
    //Search button
    
    _watchlist = [[UIBarButtonItem alloc] initWithTitle:@"WatchList" style:UIBarButtonItemStyleDone target:self action:@selector(watchlistAction:)];
    self.navigationItem.leftBarButtonItem = _watchlist;
    
    //Header and stuff
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 75)];
    _header = [_customGUI defaultLabel:@"Top Ten"];
    _header.textColor = [UIColor whiteColor];
    _header.frame = CGRectMake(0, 10, self.view.frame.size.width, 35);
    _header.adjustsFontSizeToFitWidth = YES;
    
    headerView.backgroundColor = [UIColor blackColor];
    [headerView addSubview:_header];
    self.tableView.tableHeaderView = headerView;
    
}
-(void)watchlistAction:(UIBarButtonItem*)sender{
    WatchList *watch = [[WatchList alloc] init];
    [_sharedDelegate.navController pushViewController:watch animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

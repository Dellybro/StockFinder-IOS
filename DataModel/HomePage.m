//
//  HomePage.m
//  DataModel
//
//  Created by Travis Delly on 7/9/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//
#import "HomePage.h"
#import "AppDelegate.h"

@interface HomePage ()

@property AppDelegate *sharedDelegate;

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setup{
    _TopTen = [[TopRated alloc] init];
    _search = [[SearchPage alloc] init];
    _watchList = [[WatchList alloc] init];
    [self setupTopTen];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:_TopTen];
    [tabViewControllers addObject:_search];
    [tabViewControllers addObject:_watchList];
    
    [self setViewControllers:tabViewControllers];
    //can't set this until after its added to the tab bar
    _TopTen.tabBarItem =
    [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
    _search.tabBarItem =
    [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
    
    _watchList.tabBarItem =
    [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:3];
}

//Selected stuff
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if(item.tag == 1){
        [self setupTopTen];
        
    } else if (item.tag == 2){
        [self setupSearch];
        
    } else if (item.tag == 3){
        [self setupWatchList];
    }
}

//setup Stuff
-(void)setupTopTen{
    _TopTen.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.rightBarButtonItem = nil;
}
-(void)setupSearch{
    _search.view.backgroundColor = [UIColor colorWithRed:100.0f/255.0f green:141.0f/255.0f blue:197.0f/255.0f alpha:1];
    self.navigationItem.rightBarButtonItem = nil;
}
-(void)setupWatchList{
    UIBarButtonItem *deleteAll = [[UIBarButtonItem alloc] initWithTitle:@"Delete All" style:UIBarButtonItemStyleDone target:self action:@selector(deleteAllObjects:)];
    self.navigationItem.rightBarButtonItem = deleteAll;
}
-(void)deleteAllObjects:(UIBarButtonItem*)sender{
    [_sharedDelegate deleteAllObjects:@"User"];
    _sharedDelegate.userWatchList = [[NSMutableArray alloc] init];
    [_watchList.tableView reloadData];
}

@end

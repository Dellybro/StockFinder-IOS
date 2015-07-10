//
//  HomePage.m
//  DataModel
//
//  Created by Travis Delly on 7/9/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//
#import "WatchList.h"
#import "HomePage.h"
#import "AppDelegate.h"

@interface HomePage ()

@property AppDelegate *sharedDelegate;

@end

@implementation HomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    
    
    _TopTen = [[TopRated alloc] init];
    _search = [[SearchPage alloc] init];
    _view3 = [[UIViewController alloc] init];
    [self setupViewOne];
    
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] init];
    [tabViewControllers addObject:_TopTen];
    [tabViewControllers addObject:_search];
    [tabViewControllers addObject:_view3];
    
    [self setViewControllers:tabViewControllers];
    //can't set this until after its added to the tab bar
    _TopTen.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"TopTen"
                                  image:[UIImage imageNamed:@"view1"]
                                    tag:1];
    _search.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"Search"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:2];
    _view3.tabBarItem =
    [[UITabBarItem alloc] initWithTitle:@"view3"
                                  image:[UIImage imageNamed:@"view3"]
                                    tag:3];
    
    self.tabBarController.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Selected stuff
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if(item.tag == 1){
        [self setupViewOne];
        
    } else if (item.tag == 2){
        [self setupViewTwo];
        
    } else if (item.tag == 3){
        [self setupViewThree];
    }
}
-(void)watchlistAction:(UIBarButtonItem*)sender{
    WatchList *watch = [[WatchList alloc] init];
    [_sharedDelegate.navController pushViewController:watch animated:YES];
}

//setup Stuff
-(void)setupViewOne{
    UIBarButtonItem *watchList = [[UIBarButtonItem alloc] initWithTitle:@"WatchList" style:UIBarButtonItemStyleDone target:self action:@selector(watchlistAction:)];
    self.navigationItem.leftBarButtonItem = watchList;
    _TopTen.view.backgroundColor = [UIColor grayColor];
}
-(void)setupViewTwo{
    _search.view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:141.0f/255.0f blue:71.0f/255.0f alpha:1];
    UIBarButtonItem *watchList = [[UIBarButtonItem alloc] initWithTitle:@"WatchList" style:UIBarButtonItemStyleDone target:self action:@selector(watchlistAction:)];
    self.navigationItem.leftBarButtonItem = watchList;
}
-(void)setupViewThree{
    _view3.view.backgroundColor = [UIColor greenColor];
    self.navigationItem.leftBarButtonItem = nil;
    
}

@end

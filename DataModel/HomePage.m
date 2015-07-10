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

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    
    
    _TopTen = [[TopRated alloc] init];
    _search = [[SearchPage alloc] init];
    _watchList = [[WatchList alloc] init];
    [self setupViewOne];
    
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

//setup Stuff
-(void)setupViewOne{
    _TopTen.view.backgroundColor = [UIColor grayColor];
}
-(void)setupViewTwo{
    _search.view.backgroundColor = [UIColor colorWithRed:255.0f/255.0f green:141.0f/255.0f blue:71.0f/255.0f alpha:1];
}
-(void)setupViewThree{
    
}

@end

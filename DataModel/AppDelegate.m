//
//  AppDelegate.m
//  DataModel
//
//  Created by Travis Delly on 7/6/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "AppDelegate.h"
#import "Company.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _topTenNames = [NSMutableArray arrayWithObjects:@"AAPL", @"RAI", @"EHTH", @"VSAR", @"CFI", @"ABG", @"TCP", nil];
    _topTen = [[NSMutableArray alloc] init];

    Company *AAPL = [[Company alloc] init];
    AAPL.StockExchange = @"WIKI";
    AAPL.StockLOGO = @"AAPL";
    AAPL.startDate = @"2015-07-01";
    AAPL.endDate = @"2015-07-10";
    
    _watchList = [[NSMutableArray alloc] initWithObjects:AAPL, nil];
    
    _helper = [[HTTPHelper alloc] init];
    
    for (int x = 0; x < _topTenNames.count; x++) {
        NSMutableArray *companyInfo = [self.helper find_companyTOPTEN:@"WIKI" for:[_topTenNames objectAtIndex:x] startDate:@"2015-07-01" endDate:@"2015-07-08"];
        if(companyInfo.count > 2){
            [_topTen addObject:companyInfo];
        }
    }
    
    
    _rootView = [[HomePage alloc] init];
    _topController = [[TopRated alloc] init];
    _navController = [[UINavigationController alloc] initWithRootViewController:_rootView];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:_navController];
    [_navController popToRootViewControllerAnimated:NO];
    
    
    [self.window makeKeyAndVisible];
    
    //[self WIKI];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

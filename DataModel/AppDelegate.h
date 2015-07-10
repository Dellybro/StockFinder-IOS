//
//  AppDelegate.h
//  DataModel
//
//  Created by Travis Delly on 7/6/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopRated.h"
#import "HTTPHelper.h"
#import "HomePage.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property HTTPHelper *helper;

@property (strong, nonatomic) UIWindow *window;

@property UINavigationController *navController;
@property TopRated *topController;
@property HomePage *rootView;



//Will be deleting soon.
@property NSMutableArray* topTen;
@property NSMutableArray* topTenNames;

@property NSMutableArray* watchList;

@end


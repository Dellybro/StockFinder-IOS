//
//  HomePage.h
//  DataModel
//
//  Created by Travis Delly on 7/9/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopRated.h"
#import "SearchPage.h"
#import "WatchList.h"

@interface HomePage : UITabBarController

@property WatchList *watchList;
@property TopRated *TopTen;
@property SearchPage *search;

@end

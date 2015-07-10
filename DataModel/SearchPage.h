//
//  SearchPage.h
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchPage : UIViewController

@property UILabel *pageTitle;

@property UITextField *data_source;
@property UITextField *companyStockLogo;

@property UITextField *startDate;
@property UITextField *endDate;

@property UILabel *hint;
@property UILabel *hint2;

@property UIButton *searchButton;
@property UIButton *found;

@property UIButton* addToWatchList;

@property NSMutableArray *data;

@end

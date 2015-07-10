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

@property UITextField *exchangeName;
@property UITextField *companyStockLogo;

@property UITextField *startDate;
@property UITextField *endDate;

@property UILabel *hint;

@property UIButton *searchButton;
@property UIButton *found;

@property UIButton* addToWatchList;

@property NSMutableArray *data;

@end

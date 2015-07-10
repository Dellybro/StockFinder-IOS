//
//  ShowCaseTableView.h
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCaseTableView : UITableViewController <UISearchResultsUpdating>

@property NSArray *theData;


@property NSString *nameOfCompany;

@property NSMutableArray *ShownData;

@property NSMutableArray* meaningforRow;

@property UILabel *header;

@end

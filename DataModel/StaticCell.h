//
//  StaticCell.h
//  DataModel
//
//  Created by Travis Delly on 7/9/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"

@interface StaticCell : UITableViewCell

//WatchList

@property Company *companyForCell;
@property UILabel *state;

//Search
@property NSString *meaningForRow;

//TopTen+
@property NSMutableString *CompanyName;
@property NSMutableArray *CompanyDetails;


@end

//
//  HTTPHelper.h
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPHelper : NSObject
-(NSMutableArray*)find_company:(NSString*)exchangeName for:(NSString*)company startDate:(NSString*)start endDate:(NSString*)endDate;

@end

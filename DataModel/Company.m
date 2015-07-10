//
//  Company.m
//  DataModel
//
//  Created by Travis Delly on 7/8/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "Company.h"

@implementation Company


-(id)initWithDict:(NSMutableDictionary*)dict{
    self = [self init];
    if (self){
        self.StockLOGO = [dict objectForKey:@"StockLOGO"];
        self.StockExchange = [dict objectForKey:@"StockExchange"];
        self.startDate = [dict objectForKey:@"startDate"];
        self.endDate = [dict objectForKey:@"endDate"];
    }
    return self;
}

-(NSMutableDictionary*)toDict{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    [dict setObject:self.StockLOGO forKey:@"StockLOGO"];
    [dict setObject:self.StockExchange forKey:@"StockExchange"];
    [dict setObject:self.startDate forKey:@"startDate"];
    [dict setObject:self.endDate forKey:@"endDate"];
    
    return dict;
}

@end

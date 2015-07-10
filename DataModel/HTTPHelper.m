//
//  HTTPHelper.m
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "HTTPHelper.h"

@implementation HTTPHelper

-(NSMutableArray*)find_companyTOPTEN:(NSString*)exchangeName for:(NSString*)company startDate:(NSString*)start endDate:(NSString*)endDate{
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.quandl.com/api/v1/datasets/%@/%@.json?trim_start=%@&trim_end=%@&auth_token=RggaXWEcfyebq2wNZHSB", exchangeName, company, start, endDate]];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    if(error == nil){
        NSError *jsonError;
        NSMutableDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        if([json objectForKey:@"error"] == nil){
            NSMutableArray *dataForComapany = [json objectForKey:@"data"];
            return dataForComapany;
        } else {
            NSMutableArray *fail = [NSMutableArray arrayWithObjects:[json objectForKey:@"error"], nil];
            return fail;
        }
    } else {
        NSMutableArray *fail = [NSMutableArray arrayWithObjects:error, nil];
        return fail;
    }
}


@end

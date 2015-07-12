//
//  DescriptionForRowPage.m
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "DescriptionForRowPage.h"
#import "AppDelegate.h"

@interface DescriptionForRowPage ()

@property AppDelegate *sharedDelegate;


@end

@implementation DescriptionForRowPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _meaning.frame = CGRectMake(0, 250, self.view.frame.size.width, 30);
    _meaning.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_meaning];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

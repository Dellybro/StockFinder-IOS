//
//  SearchPage.m
//  DataModel
//
//  Created by Travis Delly on 7/7/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "SearchPage.h"
#import "AppDelegate.h"
#import "CustomGUI.h"
#import "ShowCaseTableView.h"
#import "Company.h"

@interface SearchPage ()

@property AppDelegate *sharedDelegate;
@property CustomGUI *customGUI;

@end

@implementation SearchPage

-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _sharedDelegate = [[UIApplication sharedApplication] delegate];
    _customGUI = [[CustomGUI alloc] init];
    
    [self setup];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)resetFields{
    _companyStockLogo.text = nil;
    _data_source.text = @"EOD";
    _startDate.text = nil;
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString* todaysDate = [DateFormatter stringFromDate:[NSDate date]];
    _endDate.text = todaysDate;
}
-(void)setup{
    _pageTitle = [_customGUI defaultLabel:@"Search"];
    _pageTitle.frame = CGRectMake(0, 50, self.view.frame.size.width, 40);
    
    _hint = [_customGUI defaultLabel:@"Not case sensitive"];
    _hint.textColor = [UIColor lightGrayColor];
    _hint.frame = CGRectMake(100, 97, self.view.frame.size.width-200, 15);
    _hint.adjustsFontSizeToFitWidth = YES;
    
    _hint2 = [_customGUI defaultLabel:@"Warning change data source on own terms"];
    _hint2.textColor = [UIColor lightGrayColor];
    _hint2.frame = CGRectMake(0, 115, self.view.frame.size.width, 25);
    _hint2.adjustsFontSizeToFitWidth = YES;
    
    _data_source = [_customGUI defaultTextFieldWithText:@"EOD"];
    _data_source.frame = CGRectMake(70, 150, self.view.frame.size.width-140, 30);
    
    _companyStockLogo = [_customGUI defaultTextField:@"Company Stock Name"];
    _companyStockLogo.frame = CGRectMake(70, 200, self.view.frame.size.width-140, 30);
    
    _startDate = [_customGUI defaultTextField:@"Start Date"];
    _startDate.frame = CGRectMake(70, 250, self.view.frame.size.width-140, 30);
    
    
    NSDateFormatter *DateFormatter=[[NSDateFormatter alloc] init];
    [DateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString* todaysDate = [DateFormatter stringFromDate:[NSDate date]];
    _endDate = [_customGUI defaultTextFieldWithText:todaysDate];
    _endDate.frame = CGRectMake(70, 300, self.view.frame.size.width-140, 30);
    
    _searchButton = [_customGUI defaultButton:@"search"];
    _searchButton.frame = CGRectMake(100, 350, self.view.frame.size.width-200, 30);
    [_searchButton addTarget:self action:@selector(searchResult:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_hint2];
    [self.view addSubview:_hint];
    [self.view addSubview:_startDate];
    [self.view addSubview:_endDate];
    [self.view addSubview:_data_source];
    [self.view addSubview:_companyStockLogo];
    [self.view addSubview:_searchButton];
    [self.view addSubview:_pageTitle];
    
}
-(void)searchResult:(UIButton*)sender{
    if([_found superview]){
        [_found removeFromSuperview];
    }
    
    _data_source.text = _data_source.text.uppercaseString;
    _companyStockLogo.text = _companyStockLogo.text.uppercaseString;
    _data = [_sharedDelegate.helper find_company:_data_source.text for:_companyStockLogo.text startDate:_startDate.text endDate:_endDate.text];
    NSLog(@"%@", _data);
    if (_data.count > 1){
        _found = [_customGUI standardButton:[NSString stringWithFormat:@"Found: %@ click here", _companyStockLogo.text]];
        [_found addTarget:self action:@selector(gotoResults:) forControlEvents:UIControlEventTouchUpInside];
        _found.titleLabel.font = [UIFont fontWithName:@"Copperplate-Bold" size:16];
        _found.frame = CGRectMake(30, 400, self.view.frame.size.width-60, 30);
        
        _addToWatchList = [_customGUI standardButton:@"Add to Watch list"];
        [_addToWatchList addTarget:self action:@selector(addToWatch:) forControlEvents:UIControlEventTouchUpInside];
        _addToWatchList.titleLabel.font = [UIFont fontWithName:@"Copperplate-Bold" size:16];
        _addToWatchList.frame = CGRectMake(30, 450, self.view.frame.size.width-60, 30);
        
        [self.view addSubview:_addToWatchList];
        [self.view addSubview:_found];
    } else {
        _found = [_customGUI standardButton:@"Not Found"];
        _found.frame = CGRectMake(50, 400, self.view.frame.size.width-100, 30);
        [self.view addSubview:_found];
        
    }
}
-(void)addToWatch:(UIButton*)sender{
    Company *foundCompany = [[Company alloc] init];
    foundCompany.StockLOGO = _companyStockLogo.text;
    foundCompany.StockExchange = _data_source.text;
    foundCompany.startDate = _startDate.text;
    foundCompany.endDate = _endDate.text;
    
    [_sharedDelegate saveUserStocklist:foundCompany];
    
    [self alert:@"Added" with:_companyStockLogo.text buttonAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {[self resetFields];}]];
}
-(void)alert:(NSString*)alertTitle with:(NSString*)alertMessage buttonAction:(UIAlertAction*)button{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:alertTitle
                                                                   message:alertMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:button];
    
    [_sharedDelegate.navController presentViewController:alert animated:YES completion:nil];
}
-(void)gotoResults:(UIButton*)sender{
    ShowCaseTableView *searchResults = [[ShowCaseTableView alloc] init];
    searchResults.theData = _data;
    searchResults.nameOfCompany = _companyStockLogo.text;
    [_sharedDelegate.navController pushViewController:searchResults animated:YES];
}

@end

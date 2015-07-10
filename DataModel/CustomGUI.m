//
//  CustomGUI.m
//  DataModel
//
//  Created by Travis Delly on 7/6/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "CustomGUI.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomGUI{
    AppDelegate *sharedDelegate;
}


-(id)init{
    self = [super init];
    if (self){
        sharedDelegate = [[UIApplication sharedApplication] delegate];
        
    }
    return self;
}

-(UITextField*)defaultTextField:(NSString*)placeHolder{
    UITextField* textField = [[UITextField alloc] init];
    textField.layer.borderWidth = 1.0f;
    textField.layer.cornerRadius = 5.0f;
    textField.backgroundColor = [UIColor whiteColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.layer.masksToBounds = YES;
    textField.placeholder = placeHolder;
    
    
    return textField;
}
-(UITextField*)defaultTextFieldWithText:(NSString*)text{
    UITextField* textField = [[UITextField alloc] init];
    textField.layer.borderWidth = 1.0f;
    textField.layer.cornerRadius = 5.0f;
    textField.backgroundColor = [UIColor whiteColor];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.layer.masksToBounds = YES;
    textField.text = text;
    
    
    return textField;
}
-(UIView*)defaultView{
    
    UIView *view = [[UIView alloc] init];
    view.layer.borderWidth = 1;
    view.layer.cornerRadius = 5.0f;
    view.layer.masksToBounds = YES;
    
    return view;
}

-(UITextView*)defaultTextView{
    UITextView *myTextView = [[UITextView alloc] init];
    myTextView.font = [UIFont fontWithName:@"AppleSDGothicNeo-Regular" size:12];
    myTextView.layer.borderWidth = 1.0f;
    myTextView.layer.cornerRadius = 5.0f;
    myTextView.textAlignment = NSTextAlignmentCenter;
    myTextView.layer.masksToBounds = YES;
    myTextView.backgroundColor = [UIColor whiteColor];
    //some other setup like setting the font for the UITextView...
    [myTextView sizeToFit];
    
    return myTextView;
}
-(UILabel*)defaultLabel:(NSString*)text{
    
    UILabel *labelView = [[UILabel alloc] init];
    labelView.textAlignment = NSTextAlignmentCenter;
    labelView.font = [UIFont fontWithName:@"Copperplate-Bold" size:24];
    labelView.textColor = [UIColor blackColor];
    labelView.text = text;
    return labelView;
}
-(UIButton*)defaultButton:(NSString*)text{
    UIButton *defaultB = [[UIButton alloc] init];
    defaultB.layer.cornerRadius = 8.530f;
    defaultB.layer.masksToBounds = YES;
    defaultB.layer.borderWidth = 1.0f;
    defaultB.titleLabel.adjustsFontSizeToFitWidth = YES;
    [defaultB setBackgroundImage:[UIImage imageNamed:@"buttonNormal"] forState:UIControlStateNormal];
    [defaultB setBackgroundImage:[UIImage imageNamed:@"buttonClicked"] forState:UIControlStateHighlighted];
    [defaultB setTitle:text forState:UIControlStateNormal];
    defaultB.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-CondensedBold" size:18];
    return defaultB;
}
-(UIButton*)standardButton:(NSString*)text{
    UIButton *defaultB = [[UIButton alloc] init];
    [defaultB setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [defaultB setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    defaultB.titleLabel.font = [UIFont systemFontOfSize:10];
    [defaultB setTitle:text forState:UIControlStateNormal];
    return defaultB;
}
-(UIView*)backgroundForUsers:(UIColor*)colorForBack{
    UIView *view;
    
    
    return view;
}


//For Providers


//For consumers
-(UIButton*)defaultMenuButton:(NSString*)title{
    UIButton *button = [[UIButton alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"menubar"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"menubarSelected"] forState:UIControlStateSelected];
    button.titleLabel.font = [UIFont fontWithName:@"AmericanTypewriter-CondensedBold" size:16];
    
    button.layer.borderWidth = 1;
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    
    return button;
}
-(UIView*)backgroundView{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed: 153.0f/255.0 green: 204.1f/255.0 blue:255.0f/255.0 alpha: 1.0];
    view.layer.borderWidth = 6.75f;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    
    return view;
}
-(UIView*)CustomConsumerNavBar{
    UIView *view = [[UIView alloc] init];
    view.layer.borderWidth = 1.0f;
    
    view.frame = CGRectMake(0, 0, sharedDelegate.navController.navigationBar.frame.size.width, 75);
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, sharedDelegate.navController.navigationBar.frame.size.width, 75)];
    background.image = [UIImage imageNamed:@"UserNav"];
    
    [view.viewForBaselineLayout addSubview:background];
    
    return view;
}



@end
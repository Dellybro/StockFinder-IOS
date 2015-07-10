//
//  StaticCell.m
//  DataModel
//
//  Created by Travis Delly on 7/9/15.
//  Copyright (c) 2015 Travis Delly. All rights reserved.
//

#import "StaticCell.h"
#import "CustomGUI.h"

@implementation StaticCell{
    CustomGUI *customGUI;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        customGUI = [[CustomGUI alloc] init];
        _state = [customGUI defaultLabel:@""];
        _state.font = [UIFont systemFontOfSize:12];
        _state.frame = CGRectMake(self.viewForBaselineLayout.frame.size.width-90, self.viewForBaselineLayout.frame.size.height/2, 90, 30);
        
        self.detailTextLabel.textColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor whiteColor];
        
        [self.viewForBaselineLayout addSubview:_state];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  MenuVersionCell.m
//  WebShop
//
//  Created by walter on 15/9/18.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "MenuVersionCell.h"

@implementation MenuVersionCell

- (void)awakeFromNib {
    // Initialization code
    self.versionMotion.layer.borderWidth=0.5;
    self.versionMotion.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    self.versionOpen.layer.borderWidth=0.5;
    self.versionOpen.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    [self.versionMotion setTag:0];
    [self.versionOpen setTag:1];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)SelectVersion:(UIButton *)sender {
    for (UIView *view in [self.contentView subviews]) {
        
        if ([view isMemberOfClass:[UIButton class]]) {
            
            UIButton *button=(UIButton*)view;
            
            if (button.tag ==sender.tag) {
                button.layer.borderWidth=0.5;
                button.layer.borderColor=[UIColor redColor].CGColor;
            }
            else
            {
                button.layer.borderWidth=0.5;
                button.layer.borderColor=[UIColor lightGrayColor].CGColor;
            }
        }
    }
}


@end

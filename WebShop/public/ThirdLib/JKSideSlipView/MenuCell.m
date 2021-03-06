//
//  MenuCell.m
//  JKSideSlipView
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    // Initialization code
    self.colorGold.layer.borderWidth=0.5;
    self.colorGold.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    self.colorGray.layer.borderWidth=0.5;
    self.colorGray.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    self.colorSiviler.layer.borderWidth=0.5;
    self.colorSiviler.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    [self.colorGold setTag:0];
    [self.colorGray setTag:1];
    [self.colorSiviler setTag:2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)SelectColor:(UIButton *)sender {
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

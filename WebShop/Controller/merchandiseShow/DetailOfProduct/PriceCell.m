//
//  PriceCell.m
//  WebShop
//
//  Created by walter on 15/9/11.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "PriceCell.h"

@implementation PriceCell

- (void)awakeFromNib {
    // Initialization code
    self.lblHandExpert.layer.borderColor=[UIColor redColor].CGColor;
    self.lblHandExpert.layer.borderWidth=0.5;
    
    self.lblNotification.layer.borderColor=[UIColor grayColor].CGColor;
    self.lblNotification.layer.borderWidth=0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

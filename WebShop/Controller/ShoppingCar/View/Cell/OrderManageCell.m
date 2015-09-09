//
//  OrderManageCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderManageCell.h"

@implementation OrderManageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)deleteBtnClick:(id)sender {
    NSLog(@"delete");
    
    [self.delegate deleteOeder:@"123456"];
    
}
@end

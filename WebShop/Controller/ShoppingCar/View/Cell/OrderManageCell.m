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
    
    [self.delegate deleteOeder:self.orderName.text];
    
}

- (void)initWithDic:(NSMutableDictionary*)dic
{
    NSLog(@"生成了一个OrderCell");
    self.orderImage.layer.cornerRadius = 36.0;
    self.orderImage.layer.masksToBounds = YES;
    
    self.backgroundColor = [UIColor lightGrayColor];
}

- (void)configWithDic:(NSMutableDictionary*)dic {
    
}
@end

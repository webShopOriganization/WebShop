//
//  OrderDetailFouthCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderDetailFouthCell.h"

@implementation OrderDetailFouthCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)initWithDic:(NSMutableDictionary*)dic {
    
    
}
- (void)configWithDic:(NSMutableDictionary*)dic {
    
    self.lblPrice.text = [NSString stringWithFormat:@"实付款: ￥%@",[dic[@"product"] objectForKey:@"price"]];
    self.lblTime.text = [NSString stringWithFormat:@"下单时间: %@", dic[@"time"]];
    self.payment.text = [NSString stringWithFormat:@"付款方式: %@", dic[@"payment"]];
}
@end

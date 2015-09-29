//
//  OrderDetailSectionCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderDetailSectionCell.h"

@implementation OrderDetailSectionCell

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
    
    self.lblReceiverName.text = [NSString stringWithFormat:@"收货人: %@",dic[@"receiverName"]];
    self.lblRecevierAdress.text = [NSString stringWithFormat:@"收货地址: %@", dic[@"receiverAdress"]];
    self.lblRecevierPhone.text = [NSString stringWithFormat:@"电话: %@", dic[@"receiverPhone"]];
}

@end

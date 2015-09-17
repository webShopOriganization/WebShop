//
//  OrderManageCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderManageCell.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

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

    [self.delegate deleteOeder:self.lblOrderName.text];
    [self.delegate sendIndexPath:self.indexPath];
    
}

- (IBAction)OrderDetailBtnClick:(id)sender {
    [self.delegate jumpToOrderDetail:self.indexPath];
}

- (void)initWithDic:(NSMutableDictionary*)dic
{
    NSLog(@"生成了一个OrderCell");
    self.imgOrder.layer.cornerRadius = 5.0f;
    self.imgOrder.layer.borderWidth = 1.0f;
    self.imgOrder.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.imgOrder.layer.masksToBounds = YES;
    
    self.btn_Orderdetails.layer.cornerRadius = 2.0f;
    self.btn_Orderdetails.layer.borderWidth = 1.0f;
    self.btn_Orderdetails.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.btn_Orderdetails.layer.masksToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void)configWithDic:(NSMutableDictionary*)dic {
    
    if (dic) {
        self.lblOrderName.text = dic[@"proName"];
        self.lblReallyPay.text = [NSString stringWithFormat:@"￥%@", dic[@"price"]];
        [self.imgOrder sd_setImageWithURL:dic[@"image"]
                           placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];

    }

}
@end

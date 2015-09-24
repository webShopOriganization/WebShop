//
//  OrderDetailThirdCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderDetailThirdCell.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@implementation OrderDetailThirdCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initWithDic:(NSMutableDictionary*)dic {
    
    self.imgIcon.layer.cornerRadius = 5.0f;
    self.imgIcon.layer.borderWidth = 1.0f;
    self.imgIcon.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.imgIcon.layer.masksToBounds = YES;
    
//    self.backgroundColor = [UIColor clearColor];
}
- (void)configWithDic:(NSMutableDictionary*)dic {
    
    if (dic) {
        self.lblName.text = [dic[@"product"] objectForKey:@"proName"];
        self.lblPrice.text = [NSString stringWithFormat:@"￥%@",[dic[@"product"] objectForKey:@"price"]];
        self.lblSaleCount.text = [NSString stringWithFormat:@"x %@",[dic[@"product"] objectForKey:@"saleCount"]];
        [self.imgIcon sd_setImageWithURL:[dic[@"product"] objectForKey:@"image"]
                           placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
    }
}


@end

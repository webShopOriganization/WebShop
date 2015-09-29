//
//  ReviewFirstCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/24.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ReviewFirstCell.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@implementation ReviewFirstCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)initWithDic:(NSMutableDictionary*)dic {
    
    self.imgProduct.layer.cornerRadius = 5.0f;
    self.imgProduct.layer.borderWidth = 1.0f;
    self.imgProduct.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.imgProduct.layer.masksToBounds = YES;
    
}

- (void)configWithDic:(NSMutableDictionary*)dic {
    
    self.lblPrice.text = [NSString stringWithFormat:@"￥%@",[dic[@"product"] objectForKey:@"price"]];
    self.lblSaleCount.text = [NSString stringWithFormat:@"x %@", [dic[@"product"] objectForKey:@"saleCount"]];
    self.lblProductName.text = [dic[@"product"] objectForKey:@"proName"];
    
    [self.imgProduct sd_setImageWithURL:[dic[@"product"] objectForKey:@"image"]
                    placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
}


@end

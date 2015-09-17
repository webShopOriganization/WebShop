//
//  FooterView.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "FooterView.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@implementation FooterView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.img_01.layer.cornerRadius = 5.0f;
    self.img_01.layer.borderWidth = 1.0f;
    self.img_01.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.img_01.layer.masksToBounds = YES;
    
    self.img_02.layer.cornerRadius = 5.0f;
    self.img_02.layer.borderWidth = 1.0f;
    self.img_02.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.img_02.layer.masksToBounds = YES;

    
    self.img_03.layer.cornerRadius = 5.0f;
    self.img_03.layer.borderWidth = 1.0f;
    self.img_03.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.img_03.layer.masksToBounds = YES;

    self.backgroundColor = [UIColor clearColor];
}

- (void)configWithDic:(NSMutableDictionary*)dic {
    NSLog(@"dic = %@", dic);
    
    NSNumber *productID = dic[@"productId"];
    if ([productID intValue] == 2) {
        [self.img_01 sd_setImageWithURL:dic[@"image"]
    placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
        self.lblProductName_01.text = dic[@"proName"];
        self.lblPrice_01.text = [NSString stringWithFormat:@"￥%@", dic[@"price"]] ;
        
    }else if ([productID intValue] == 3){
        [self.img_02 sd_setImageWithURL:dic[@"image"]
                       placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
        self.lblProductName_02.text = dic[@"proName"];
        self.lblPrice_02.text = [NSString stringWithFormat:@"￥%@", dic[@"price"]] ;
        
    }else if ([productID intValue] == 4){
        [self.img_03 sd_setImageWithURL:dic[@"image"]
                       placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
        self.lblProductName_03.text = dic[@"proName"];
        self.lblPrice_03.text = [NSString stringWithFormat:@"￥%@", dic[@"price"]] ;
    }
    
}

- (IBAction)upBtnClick:(id)sender {
}
@end

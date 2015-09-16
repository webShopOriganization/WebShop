//
//  ShoppingCartCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ShoppingCartCell.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@interface ShoppingCartCell ()


@end

@implementation ShoppingCartCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)btnChooseClick:(id)sender {
    if (self.imgForBtnSeleted.hidden == YES) {
        self.imgForBtnSeleted.hidden = NO;
        
        [self.delegate addObjectToDeleteArray:self.indexPath];
        [self.delegate addObjectToPayArray:self.indexPath];
        [self.delegate totalNeedPayFor:self.indexPath];
    }else{
        self.imgForBtnSeleted.hidden = YES;
        
        [self.delegate deleteFromDeleteArray:self.indexPath];
        [self.delegate deleteFromPayArray:self.indexPath];
        [self.delegate totalNeedPayFor:self.indexPath];
    }
    
    
}

- (IBAction)btnDeleteOne:(id)sender {
    int saleCount = [self.lblSaleCount.text intValue];
    
    if (saleCount == 1) {
        self.btnDeleteOne.enabled = NO;
        self.lblSaleCount.text = @"1";
    }else{
        self.lblSaleCount.text = [NSString stringWithFormat:@"%d", saleCount - 1];
    }
}

- (IBAction)btnAddOne:(id)sender {
    int saleCount = [self.lblSaleCount.text intValue];
    self.lblSaleCount.text = [NSString stringWithFormat:@"%d", saleCount + 1];
}

- (void)initWithDic:(NSMutableDictionary*)dic {
    NSLog(@"生成了一个ProductCell");
    
    self.imgProduct.layer.cornerRadius = 5.0f;
    self.imgProduct.layer.borderWidth = 1.0f;
    self.imgProduct.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.imgProduct.layer.masksToBounds = YES;
    
    self.imgForBtnSeleted.layer.cornerRadius = 10.0f;
    self.imgForBtnSeleted.layer.masksToBounds = YES;
    
    self.btnChoose.layer.borderWidth = 1.0f;
    self.btnChoose.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.btnChoose.layer.cornerRadius = 10.0f;
    self.btnChoose.layer.masksToBounds = YES;
    
    self.btnDeleteOne.layer.borderWidth = 1.0f;
    self.btnDeleteOne.layer.borderColor = [[UIColor grayColor] CGColor];
    self.btnDeleteOne.layer.cornerRadius = 2.0f;
    self.btnDeleteOne.layer.masksToBounds = YES;
    
    self.btnAddOne.layer.borderWidth = 1.0f;
    self.btnAddOne.layer.borderColor = [[UIColor grayColor] CGColor];
    self.btnAddOne.layer.cornerRadius = 2.0f;
    self.btnAddOne.layer.masksToBounds = YES;
    
    self.lblSaleCount.layer.borderWidth = 1.0f;
    self.lblSaleCount.layer.borderColor = [[UIColor grayColor] CGColor];
    self.lblSaleCount.layer.masksToBounds = YES;
    
    self.backgroundColor = [UIColor clearColor];
}
- (void)configWithDic:(NSMutableDictionary*)dic {
    
    if (dic) {
        self.lblProName.text = dic[@"proName"];
        self.lblPrice.text = [NSString stringWithFormat:@"￥%@", dic[@"price"]];
        self.lblSaleCount.text = dic[@"saleCount"];
        [self.imgProduct sd_setImageWithURL:dic[@"image"]
                                    placeholderImage:[UIImage imageNamed:@"bg2"] options:SDWebImageContinueInBackground];
    }
}

@end

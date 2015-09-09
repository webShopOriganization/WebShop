//
//  ShoppingCartCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ShoppingCartCell.h"

@implementation ShoppingCartCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initWithDic:(NSMutableDictionary*)dic {
    NSLog(@"生成了一个ProductCell");
    
    self.imgProduct.layer.cornerRadius = 36;
    self.imgProduct.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor clearColor];

}
- (void)configWithDic:(NSMutableDictionary*)dic {
    
}

@end

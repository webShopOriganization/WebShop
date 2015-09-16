//
//  PayOrderView.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "PayOrderView.h"

@implementation PayOrderView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // add subviews
    }
    return self;
}

+(PayOrderView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"PayOrderView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    self.btnForChooseAll.layer.borderWidth = 1.0f;
    self.btnForChooseAll.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.btnForChooseAll.layer.cornerRadius = 10.0f;
    self.btnForChooseAll.layer.masksToBounds = YES;
    
    self.imgForBtnSelected.layer.cornerRadius = 10.0f;
    self.imgForBtnSelected.layer.masksToBounds = YES;
    
    self.lblAllPrice.text = @"合计￥0.00";
 

}

@end

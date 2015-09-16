//
//  PayOrderDeleteView.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "PayOrderDeleteView.h"

@implementation PayOrderDeleteView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // add subviews
    }
    return self;
}

+(PayOrderDeleteView *)instanceView {
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"PayOrderDeleteView" owner:nil options:nil];
    return [nibView objectAtIndex:0];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    self.btnSecond.layer.borderWidth = 1.0f;
    self.btnSecond.layer.borderColor = [[UIColor grayColor] CGColor];
    self.btnSecond.layer.cornerRadius = 10.0f;
    self.btnSecond.layer.masksToBounds = YES;
    
    self.btnDelete.layer.borderWidth = 1.0f;
    self.btnDelete.layer.borderColor = [[UIColor redColor] CGColor];
    self.btnDelete.layer.cornerRadius = 5.0f;
    self.btnDelete.layer.masksToBounds = YES;
    
    self.imgSecond.layer.cornerRadius = 10.0f;
    self.imgSecond.layer.masksToBounds = YES;
}


@end

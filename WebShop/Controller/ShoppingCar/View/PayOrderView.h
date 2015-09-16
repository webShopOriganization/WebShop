//
//  PayOrderView.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayOrderView : UIView
@property (strong, nonatomic) IBOutlet UIButton *btnForChooseAll;
@property (strong, nonatomic) IBOutlet UIImageView *imgForBtnSelected;
@property (strong, nonatomic) IBOutlet UILabel *lblAllPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnPayOrder;

+(PayOrderView *)instanceView;
@end

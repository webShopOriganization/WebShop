//
//  PayOrderDeleteView.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayOrderDeleteView : UIView
@property (strong, nonatomic) IBOutlet UIButton *btnSecond;
@property (weak, nonatomic) IBOutlet UIImageView *imgSecond;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;

- (IBAction)deleteBtnClick:(id)sender;
- (IBAction)btnSecondClick:(id)sender;

+(PayOrderDeleteView *)instanceView;
@end

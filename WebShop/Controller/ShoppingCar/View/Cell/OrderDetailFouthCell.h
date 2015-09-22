//
//  OrderDetailFouthCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailFouthCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UILabel *lblTime;
@property (strong, nonatomic) IBOutlet UILabel *payment;


- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;
@end

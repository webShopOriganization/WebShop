//
//  OrderDetailSectionCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailSectionCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblReceiverName;
@property (strong, nonatomic) IBOutlet UILabel *lblRecevierPhone;
@property (strong, nonatomic) IBOutlet UILabel *lblRecevierAdress;


- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;

@end

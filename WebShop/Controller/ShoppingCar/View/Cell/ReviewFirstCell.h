//
//  ReviewFirstCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/24.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReviewFirstCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;
@property (strong, nonatomic) IBOutlet UILabel *lblProductName;
@property (strong, nonatomic) IBOutlet UILabel *lblSaleCount;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;


- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;

@end

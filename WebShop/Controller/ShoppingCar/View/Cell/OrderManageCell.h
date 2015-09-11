//
//  OrderManageCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol deleteOrder <NSObject>

- (void)deleteOeder:(NSString *)orderID;
//- (void)sendIndexPath:(NSIndexPath *)indexPath;

@end

@interface OrderManageCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgOrder;
@property (strong, nonatomic) IBOutlet UILabel *lblOrderName;
@property (strong, nonatomic) IBOutlet UILabel *lblReallyPay;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) id<deleteOrder> delegate;

- (IBAction)deleteBtnClick:(id)sender;

- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;
@end

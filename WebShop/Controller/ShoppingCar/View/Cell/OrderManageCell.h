//
//  OrderManageCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol deleteOrder <NSObject>

- (void)deleteOeder:(NSString *)orderId;

@end

@interface OrderManageCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *orderImage;
@property (strong, nonatomic) IBOutlet UILabel *orderName;

@property (assign, nonatomic) id<deleteOrder> delegate;

- (IBAction)deleteBtnClick:(id)sender;
@end

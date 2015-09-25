//
//  OrderDetailCtrl.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderDetailCtrl : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *btnDeleteOrder;
@property (strong, nonatomic) IBOutlet UIButton *btnOrderReview;
@property (strong, nonatomic) IBOutlet UIButton *btnBuyAgain;

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *dict;
@property (strong, nonatomic) IBOutlet UIView *bottomView;

- (IBAction)didClickBuyAgainBtn:(id)sender;
@end

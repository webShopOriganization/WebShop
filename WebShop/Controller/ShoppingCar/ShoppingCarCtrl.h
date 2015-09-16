//
//  ShoppingCarCtrl.h
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayOrderView.h"
#import "PayOrderDeleteView.h"

@interface ShoppingCarCtrl : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableVeiw;

@property (strong, nonatomic) NSDictionary *UserDic;
@property (strong, nonatomic) NSMutableArray *array;

@property (strong, nonatomic) PayOrderView *firstBottomView;
@property (strong, nonatomic) PayOrderDeleteView *secondBottomView;

- (IBAction)editBtnClick:(id)sender;






@end

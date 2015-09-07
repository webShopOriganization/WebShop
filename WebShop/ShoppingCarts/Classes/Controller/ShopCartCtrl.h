//
//  ShopCartCtrl.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCartCtrl : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *shoppingCartTableView;

@property (strong, nonatomic) NSMutableDictionary *UserDic;
@property (strong, nonatomic) NSMutableArray *array;

@end

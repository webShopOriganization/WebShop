//
//  ShoppingCarCtrl.h
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCarCtrl : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *shoppingCartTableView;

@property (strong, nonatomic) NSDictionary *UserDic;
@property (strong, nonatomic) NSMutableArray *array;

@end

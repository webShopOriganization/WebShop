//
//  DetailProdutCtrl.h
//  WebShop
//
//  Created by walter on 15/9/11.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKSideSlipView.h"
#import "MenuView.h"

@interface DetailProdutCtrl : UIViewController
{
    JKSideSlipView *_sideSlipView;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

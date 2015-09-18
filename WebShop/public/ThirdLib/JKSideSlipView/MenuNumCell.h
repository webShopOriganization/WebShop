//
//  MenuNumCell.h
//  WebShop
//
//  Created by walter on 15/9/18.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuNumCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
@property (weak, nonatomic) IBOutlet UIButton *btnReduce;
@property (weak, nonatomic) IBOutlet UITextField *txtNum;

@property (weak, nonatomic) IBOutlet UIView *viewForNum;

@end

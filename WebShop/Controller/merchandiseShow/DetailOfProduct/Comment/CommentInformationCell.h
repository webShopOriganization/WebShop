//
//  CommentInformationCell.h
//  WebShop
//
//  Created by walter on 15/9/15.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "starView.h"
#import "DynamicScrollView.h"

@interface CommentInformationCell : UITableViewCell

@property (strong,nonatomic) starView *star;

@property (weak, nonatomic) IBOutlet UIImageView *lblHead;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDetailComment;
@property (weak, nonatomic) IBOutlet UILabel *lblProductInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyDate;
@property (weak, nonatomic) IBOutlet UIButton *BtnAgree;
@property (weak, nonatomic) IBOutlet UIButton *BtnComment;
@property (weak, nonatomic) IBOutlet UIView *viewForStar;
@property (strong,nonatomic) DynamicScrollView *dynamicScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollForImage;

@end

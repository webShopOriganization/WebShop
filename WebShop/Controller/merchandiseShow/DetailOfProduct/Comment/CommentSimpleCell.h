//
//  CommentSimpleCell.h
//  WebShop
//
//  Created by walter on 15/9/15.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentSimpleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *lblHead;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UILabel *lblDetailComment;
@property (weak, nonatomic) IBOutlet UILabel *lblProductInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyDate;
@property (weak, nonatomic) IBOutlet UIButton *lblBtnAgree;
@property (weak, nonatomic) IBOutlet UIButton *lblBtnComment;
@property (weak, nonatomic) IBOutlet UIView *viewForStar;


@end

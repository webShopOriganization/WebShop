//
//  CommentDetailCell.m
//  WebShop
//
//  Created by walter on 15/9/11.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "CommentDetailCell.h"


@implementation CommentDetailCell

- (void)awakeFromNib {
    // Initialization code
    self.star=[[[NSBundle mainBundle]loadNibNamed:@"starView" owner:self options:nil] objectAtIndex:0];
    [self.star setFrame:CGRectMake(10, 5, 82, 15)];
    [self.viewForStar addSubview:self.star];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

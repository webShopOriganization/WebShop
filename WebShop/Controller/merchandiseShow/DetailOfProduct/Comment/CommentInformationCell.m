//
//  CommentInformationCell.m
//  WebShop
//
//  Created by walter on 15/9/15.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "CommentInformationCell.h"


@implementation CommentInformationCell

- (void)awakeFromNib {
    // Initialization code
    self.star=[[[NSBundle mainBundle]loadNibNamed:@"starView" owner:self options:nil] objectAtIndex:0];
    [self.star setFrame:CGRectMake(5, 5, 82, 15)];
    [self.viewForStar addSubview:self.star];
    self.star.whichValue=2.0;
    
    self.dynamicScrollView=[[DynamicScrollView alloc]initWithFrame:CGRectMake(10,89, [[UIScreen mainScreen]bounds].size.width, 87) withImages:nil];
    
    [self.contentView addSubview:self.dynamicScrollView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

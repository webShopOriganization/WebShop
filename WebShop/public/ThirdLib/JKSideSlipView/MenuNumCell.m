//
//  MenuNumCell.m
//  WebShop
//
//  Created by walter on 15/9/18.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "MenuNumCell.h"

@implementation MenuNumCell

- (void)awakeFromNib {
    // Initialization code
    self.txtNum.text=@"0";
    self.viewForNum.layer.borderWidth=0.5;
    self.viewForNum.layer.borderColor=[UIColor lightGrayColor].CGColor;
}

- (IBAction)AddNum:(UIButton *)sender {
    int num= [self.txtNum.text intValue]+1;
    self.txtNum.text=[NSString stringWithFormat:@"%d",num];
}

- (IBAction)ReduceNum:(UIButton *)sender {
    int num= [self.txtNum.text intValue]-1;
    
    if (num<0) {
        num=0;
    }
    
    self.txtNum.text=[NSString stringWithFormat:@"%d",num];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

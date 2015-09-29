//
//  ReviewSecondCell.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/24.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ReviewSecondCell.h"
#import "Common.h"

@implementation ReviewSecondCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self initUI];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)initUI
{
    self.btnSendReview.layer.cornerRadius = 3.0f;
    self.btnSendReview.layer.borderWidth = 1.0f;
    self.btnSendReview.layer.borderColor = [[UIColor redColor] CGColor];
    self.btnSendReview.layer.masksToBounds = YES;
    
    self.array_Star_img01=[NSArray arrayWithObjects: self.img_01_star1, self.img_01_star2, self.img_01_star3, self.img_01_star4, self.img_01_star5, nil];
    self.array_Star_btn01 = [NSArray arrayWithObjects: self.btn_01_image1, self.btn_01_image2, self.btn_01_image3, self.btn_01_image4, self.btn_01_image5 , nil];
    
    self.array_Star_img02=[NSArray arrayWithObjects: self.img_02_star1, self.img_02_star2, self.img_02_star3, self.img_02_star4, self.img_02_star5, nil];
    self.array_Star_btn02 = [NSArray arrayWithObjects: self.img_02_star1, self.img_02_star2, self.img_02_star3, self.img_02_star4, self.img_02_star5, nil];
    
    self.array_Star_img03=[NSArray arrayWithObjects: self.img_03_star1, self.img_03_star2, self.img_03_star3, self.img_03_star4, self.img_03_star5, nil];
    self.array_Star_btn03 = [NSArray arrayWithObjects: self.img_03_star1, self.img_03_star2, self.img_03_star3, self.img_03_star4, self.img_03_star5, nil];

    for (int i = 0; i < 5; i++) {
        [self.array_Star_img01[i] setImage:[UIImage imageNamed:star_0]];
        [self.array_Star_img02[i] setImage:[UIImage imageNamed:star_0]];
        [self.array_Star_img03[i] setImage:[UIImage imageNamed:star_0]];
    }
    
}

//-(void)setStarForValue:(CGFloat)value
//{
//    
//    int whichStar=(int)value;
//    
//    for (int i=0; i<self.array_Star_img.count; i++) {
//        UIImageView *imageView=[self.array_Star_img objectAtIndex:i];
//        
//        if (i<whichStar) {
//            [imageView setImage:[UIImage imageNamed:star_1]];
//        }
//        else
//        {
//            imageView.image=[UIImage imageNamed:star_0];
//        }
//        
//        
//        
//    }
//    
//    if (value>whichStar) {
//        UIImageView *imageView=[self.array_Star_img objectAtIndex:whichStar];
//        
//        [imageView setImage:[UIImage imageNamed:star_half]];
//    }
//}

//  第一行评分
- (IBAction)starBtnClick1:(id)sender {
    UIButton *btn = sender;
    NSLog(@"tag1 = %ld", (long)btn.tag);
    
    for ( UIButton *button in self.array_Star_btn01) {
       
        for (int i =0; i < self.array_Star_img01.count; i++) {
            
            if (btn.tag >= i) {
                NSLog(@" i = %d", i);
                [self.array_Star_img01[i] setImage:[UIImage imageNamed:star_1]];
            }else{
                [self.array_Star_img01[i] setImage:[UIImage imageNamed:star_0]];
            }

        }
    }
    
}

//  第二行评分
- (IBAction)starBtnClick2:(id)sender {
    UIButton *btn = sender;
    NSLog(@"tag2 = %ld", (long)btn.tag);

    for ( UIButton *button in self.array_Star_btn02) {
        
        for (int i =0; i < self.array_Star_img02.count; i++) {
            
            if (btn.tag >= i) {
                NSLog(@" i = %d", i);
                [self.array_Star_img02[i] setImage:[UIImage imageNamed:star_1]];
            }else{
                [self.array_Star_img02[i] setImage:[UIImage imageNamed:star_0]];
            }
            
        }
    }

}

//  第三行评分
- (IBAction)starBtnClick3:(id)sender {
    UIButton *btn = sender;
    NSLog(@"tag3 = %ld", (long)btn.tag);
    
    for ( UIButton *button in self.array_Star_btn02) {
        
        for (int i =0; i < self.array_Star_img02.count; i++) {
            
            if (btn.tag >= i) {
                NSLog(@" i = %d", i);
                [self.array_Star_img03[i] setImage:[UIImage imageNamed:star_1]];
            }else{
                [self.array_Star_img03[i] setImage:[UIImage imageNamed:star_0]];
            }
        }
    }

}

- (IBAction)btnClickSendReview:(id)sender {
    [Common addAlertViewWithTitel:@"评论成功"];
}
@end

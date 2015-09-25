//
//  ReviewSecondCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/24.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define star_1 @"Evaluation_1"
#define star_0 @"Evaluation_0"
#define star_half @"Evaluation_0.5"


@interface ReviewSecondCell : UITableViewCell

@property (strong,nonatomic)NSArray *array_Star_img01;
@property (strong,nonatomic)NSArray *array_Star_btn01;

@property (strong,nonatomic)NSArray *array_Star_img02;
@property (strong,nonatomic)NSArray *array_Star_btn02;

@property (strong,nonatomic)NSArray *array_Star_img03;
@property (strong,nonatomic)NSArray *array_Star_btn03;

@property (assign) CGFloat whichValue;

//第一行评价
@property (weak, nonatomic) IBOutlet UIButton *btn_01_image1;
@property (weak, nonatomic) IBOutlet UIButton *btn_01_image2;
@property (weak, nonatomic) IBOutlet UIButton *btn_01_image3;
@property (weak, nonatomic) IBOutlet UIButton *btn_01_image4;
@property (weak, nonatomic) IBOutlet UIButton *btn_01_image5;

@property (weak, nonatomic) IBOutlet UIImageView *img_01_star1;
@property (weak, nonatomic) IBOutlet UIImageView *img_01_star2;
@property (weak, nonatomic) IBOutlet UIImageView *img_01_star3;
@property (weak, nonatomic) IBOutlet UIImageView *img_01_star4;
@property (weak, nonatomic) IBOutlet UIImageView *img_01_star5;

//第二行评价
@property (weak, nonatomic) IBOutlet UIButton *btn_02_image1;
@property (weak, nonatomic) IBOutlet UIButton *btn_02_image2;
@property (weak, nonatomic) IBOutlet UIButton *btn_02_image3;
@property (weak, nonatomic) IBOutlet UIButton *btn_02_image4;
@property (weak, nonatomic) IBOutlet UIButton *btn_02_image5;

@property (weak, nonatomic) IBOutlet UIImageView *img_02_star1;
@property (weak, nonatomic) IBOutlet UIImageView *img_02_star2;
@property (weak, nonatomic) IBOutlet UIImageView *img_02_star3;
@property (weak, nonatomic) IBOutlet UIImageView *img_02_star4;
@property (weak, nonatomic) IBOutlet UIImageView *img_02_star5;

//第三行评价
@property (weak, nonatomic) IBOutlet UIButton *btn_03_image1;
@property (weak, nonatomic) IBOutlet UIButton *btn_03_image2;
@property (weak, nonatomic) IBOutlet UIButton *btn_03_image3;
@property (weak, nonatomic) IBOutlet UIButton *btn_03_image4;
@property (weak, nonatomic) IBOutlet UIButton *btn_03_image5;

@property (weak, nonatomic) IBOutlet UIImageView *img_03_star1;
@property (weak, nonatomic) IBOutlet UIImageView *img_03_star2;
@property (weak, nonatomic) IBOutlet UIImageView *img_03_star3;
@property (weak, nonatomic) IBOutlet UIImageView *img_03_star4;
@property (weak, nonatomic) IBOutlet UIImageView *img_03_star5;


@property (strong, nonatomic) IBOutlet UIButton *btnSendReview;
- (IBAction)btnClickSendReview:(id)sender;

-(void)setStarForValue:(CGFloat)value;

- (IBAction)starBtnClick1:(id)sender;
- (IBAction)starBtnClick2:(id)sender;
- (IBAction)starBtnClick3:(id)sender;

@end

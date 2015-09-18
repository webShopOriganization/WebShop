//
//  ShoppingCartCell.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingCarCtrl.h"

@protocol deleteCellDelegate <NSObject>

- (void)addObjectToDeleteArray:(NSIndexPath *)indexPath;
- (void)deleteFromDeleteArray:(NSIndexPath *)indexPath;

- (void)addObjectToPayArray:(NSIndexPath *)indexPath;
- (void)deleteFromPayArray:(NSIndexPath *)indexPath;

- (void)totalNeedPayFor:(NSIndexPath *)indexPath;

/**
 *  商品购买数量 +/- 1 所需费用
 */
- (void)saleCountAddOrDeleteOne:(float)changeMoney;

@end

@interface ShoppingCartCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgProduct;
@property (strong, nonatomic) IBOutlet UILabel *lblProName;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;
@property (strong, nonatomic) IBOutlet UIButton *btnChoose;
@property (weak, nonatomic) IBOutlet UIImageView *imgForBtnSeleted;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (strong, nonatomic) IBOutlet UIButton *btnDeleteOne;
@property (strong, nonatomic) IBOutlet UIButton *btnAddOne;
@property (strong, nonatomic) IBOutlet UILabel *lblSaleCount;
//@property (assign) BOOL statusForCellChoose;

@property (weak, nonatomic) id<deleteCellDelegate>delegate;
- (IBAction)btnChooseClick:(id)sender;
- (IBAction)btnDeleteOne:(id)sender;
- (IBAction)btnAddOne:(id)sender;

- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;

@end

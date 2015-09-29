//
//  OrderDetailCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderDetailCtrl.h"
#import "NetworkManager.h"
#import "OrderDetailSectionCell.h"
#import "OrderDetailThirdCell.h"
#import "OrderDetailFouthCell.h"
#import "OrderReviewCtrl.h"
#import "ShoppingCarCtrl.h"

@interface OrderDetailCtrl () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)  ShoppingCarCtrl *vc;

@end

@implementation OrderDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self initUI];
    
//    [[NetworkManager shareMgr] server_OrderDetails:nil completeHandle:^(NSDictionary *response) {
//        NSLog(@" server_OrderDetails = %@ ", response);
//    }];
    
    NSLog(@"字典 : %@", self.dict);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.bottomView.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    
    self.btnDeleteOrder.layer.cornerRadius = 2.0f;
    self.btnDeleteOrder.layer.borderWidth = 1.0f;
    self.btnDeleteOrder.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnDeleteOrder.layer.masksToBounds = YES;
    [self.btnDeleteOrder addTarget:self action:@selector(didClickDeleteOrder) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnOrderReview.layer.cornerRadius = 2.0f;
    self.btnOrderReview.layer.borderWidth = 1.0f;
    self.btnOrderReview.layer.borderColor = [[UIColor blackColor] CGColor];
    self.btnOrderReview.layer.masksToBounds = YES;
    [self.btnOrderReview addTarget:self action:@selector(didClickReviewBtn) forControlEvents:UIControlEventTouchUpInside];

    self.btnBuyAgain.layer.cornerRadius = 2.0f;
    self.btnBuyAgain.layer.borderWidth = 1.0f;
    self.btnBuyAgain.layer.borderColor = [[UIColor redColor] CGColor];
    self.btnBuyAgain.layer.masksToBounds = YES;
}

//删除订单
- (void)didClickDeleteOrder {
    
    [self.navigationController popViewControllerAnimated:YES];
}

//评论晒单
- (void)didClickReviewBtn {
    
    OrderReviewCtrl *vc = [[OrderReviewCtrl alloc] initWithNibName:@"OrderReviewCtrl" bundle:nil];
    vc.navigationItem.title = @"评价晒单";
    vc.dict = self.dict;
    
    [self.navigationController pushViewController:vc animated:YES];
}

//再次购买
- (IBAction)didClickBuyAgainBtn:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.vc = [storyboard instantiateViewControllerWithIdentifier:@"ShoppingCarCtrl"];
    self.vc.navigationItem.title = @"购物车";
    self.vc.hidesBottomBarWhenPushed = YES;
    self.bottomView.hidden = YES;
    self.vc.statusForBottomView = YES;
    
    [self.navigationController pushViewController:self.vc animated:YES];
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 44;
    }else if (indexPath.section == 1){
        return 60;
    }else if (indexPath.section == 2){
        return 90;
    }else if (indexPath.section == 3){
        return 60;
    }
    return 0;
}


#pragma mark - TableVeiw Datasource

- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{
    return 5.0f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId_Second = @"OrderDetailSectionCell";
    static NSString *CellId_Third = @"OrderDetailThirdCell";
    static NSString *CellId_Fourth = @"OrderDetailFouthCell";
    
    if (self.dict) {
        if (indexPath.section == 0) {
            
            UITableViewCell *cell = [[UITableViewCell alloc] init];
            
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.text = [NSString stringWithFormat:@"订单号: %@", self.dict[@"orderId"]];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            return cell;
            
        }else if (indexPath.section == 1){
            
            OrderDetailSectionCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId_Second];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_Second owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
                
                [cell configWithDic:self.dict];
            }
            return cell;
            
        }else if (indexPath.section == 2){
            
            OrderDetailThirdCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId_Third];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_Third owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
                
                [cell initWithDic:nil];
                [cell configWithDic:self.dict];
            }
            return cell;
            
        }else if (indexPath.section == 3){
            
            OrderDetailFouthCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId_Fourth];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_Fourth owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
                
                [cell configWithDic:self.dict];
            }
            
            return cell;
        }
    }
    return nil;
    
}






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end

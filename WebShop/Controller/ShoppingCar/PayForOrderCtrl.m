
//
//  PayForOrderCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/14.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "PayForOrderCtrl.h"
#import "PayOrderCll.h"
#import "OrderManageCtrl.h"
#import "CollectionCtrl.h"

@interface PayForOrderCtrl ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation PayForOrderCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.arrayPay = [[NSMutableArray alloc] init];
    
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITabltView datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"PayOrderCll";
    PayOrderCll *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        NSArray *topLevelObject = [[NSBundle mainBundle] loadNibNamed:cellID owner:self options:nil];
        cell = [topLevelObject objectAtIndex:0];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    if (indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"ic_alipay"];
        cell.lblPayment.text = @"支付宝";
    }else if (indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"ic_wxpay"];
        cell.lblPayment.text = @"微信支付";
    }else if (indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"ic_unionpay@2x"];
        cell.lblPayment.text = @"银联支付";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        OrderManageCtrl *vc = [storyboard instantiateViewControllerWithIdentifier:@"MemberCenterCtrl"];
//        vc.hidesBottomBarWhenPushed = YES;
//        vc.arrayOrder = self.arrayPay;
        
        CollectionCtrl *vc = [[CollectionCtrl alloc] initWithNibName:@"CollectionCtrl" bundle:nil];
        vc.hidesBottomBarWhenPushed = YES;
        vc.title = @"CollectionTest";
        vc.arrayCollection = self.arrayPay;
        
        [self.navigationController pushViewController:vc animated:YES];
    }
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

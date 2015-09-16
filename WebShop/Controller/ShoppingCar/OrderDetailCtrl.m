//
//  OrderDetailCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/16.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderDetailCtrl.h"
#import "OrderDetailSectionCell.h"
#import "OrderDetailThirdCell.h"
#import "OrderDetailFouthCell.h"

@interface OrderDetailCtrl () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation OrderDetailCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    NSLog(@"字典 : %@", self.dict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 8.0 ;
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
            cell.textLabel.text = @"订单号: 10067948430";
            
            return cell;
            
        }else if (indexPath.section == 1){
            OrderDetailSectionCell * cell = [tableView dequeueReusableCellWithIdentifier:CellId_Second];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_Second owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
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

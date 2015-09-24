//
//  OrderReviewCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/24.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderReviewCtrl.h"
#import "ReviewFirstCell.h"
#import "ReviewSecondCell.h"

@interface OrderReviewCtrl ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation OrderReviewCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    NSLog(@"字典是 ： %@", self.dict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 90;
    }else if (indexPath.section == 1){
        return 150;
    }
    return 0;
}

#pragma mark - TableVeiw Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId_First = @"ReviewFirstCell";
    static NSString *CellId_Second = @"ReviewSecondCell";
    
    if (self.dict) {
        if (indexPath.section == 0) {
            
            ReviewFirstCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId_First];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_First owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
                [cell initWithDic:nil];
                [cell configWithDic:self.dict];
            }
            return cell;
            
        }
        else if (indexPath.section == 1){
            ReviewSecondCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId_Second];
            if (!cell) {
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId_Second owner:self options:nil];
                cell = [topLevelObjects objectAtIndex:0];
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

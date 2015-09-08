//
//  ShoppingCarCtrl.m
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ShoppingCarCtrl.h"
#import "Common.h"
#import "NetworkManager.h"
#import "LoadHeaderView.h"
#import "FooterView.h"
#import "ShoppingCartCell.h"

@interface ShoppingCarCtrl ()<UITableViewDelegate, UITableViewDataSource>


@end

@implementation ShoppingCarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"购物车";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self initUI];
}

- (void)initUI {

    self.title = @"购物车";
    
//    self.UserDic = [[NSDictionary alloc] init];
    
//    [[NetworkManager shareMgr]server_loginWithDic:nil completeHandle:^(NSDictionary *response) {
//        self.UserDic = response;
//    }];
//    NSLog(@"self.userdic = %@", self.UserDic);
//    self.array = [[NSMutableArray alloc] init];
    
    [self.shoppingCartTableView reloadData];
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (self.array) {
//        return 90;
//    }else{
//        return SCREEN_HEIGHT -64-30-49-80;
//    }
//    return 0;
    
    return SCREEN_HEIGHT -64-30-49-80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
//    if (self.UserDic) {
//        return 0;
//    }else{
//        return 30;
//    }
//    return 0;
    return 30;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
//    if (self.UserDic) {
//        return 80;
//    }else{
//        return 0;
//    }
//    return 0;
    return 80;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!self.UserDic) {
    if (section == 0) {
        LoadHeaderView *loginView = [[LoadHeaderView alloc] init];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LoadHeaderView" owner:self options:nil];
        
        loginView = [topLevelObjects objectAtIndex:0];
        loginView.backgroundColor = [UIColor whiteColor];
        
        return loginView;
    }
    
    }
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    if (self.UserDic) {
        FooterView *footerView = [[FooterView alloc] init];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil];
        
        footerView = [topLevelObjects objectAtIndex:0];
    
        return footerView;
//    }
//    return nil;
    
}

#pragma mark - TableVeiw Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //
    //    if (self.UserDic) {
    //        return 2;
    //    }else{
    //        if (self.array) {
    //            return 3;//loadCell、tableviewCell、footView
    //        }else{
    //            return 1;//loadCell、tableviewCell(nil)
    //        }
    //
    //    }
    //    return 0;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //    if (self.UserDic) {
    //        if (section == 0) {
    //            return [self.array count];
    //        }else if (section == 1){
    //            return 1;
    //        }
    //    }else{
    //        if (self.array) {
    //            if (section == 0) {
    //                return 1;
    //            }else if (section == 1){
    //                return [self.array count];
    //            }else if(section == 2){
    //                return 1;
    //            }
    //        }else{
    //            return 2;
    //        }
    //    }
    
    //    return [self.array count];
    if (self.array) {
        return 5;
    }else{
        return 1;
    }
    return 0;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId = @"ShoppingCartCell";
    
    NSLog(@"self.array = %lu", (unsigned long)self.array.count);
    if (!self.array) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.text = @"购物车是空的...";
        
        return cell;
        
    }else{
        
        ShoppingCartCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
            
        }
        
        return cell;

    }
  
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end


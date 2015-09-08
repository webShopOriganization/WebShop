//
//  ShoppingCarCtrl.m
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ShoppingCarCtrl.h"
#import "Common.h"
#import "LoadHeaderView.h"
#import "FooterView.h"

@interface ShoppingCarCtrl ()

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
    
    self.UserDic = [[NSMutableDictionary alloc] init];
    
    self.array = [[NSMutableArray alloc] init];
    
    [self.shoppingCartTableView reloadData];
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.array) {
        return 90;
    }else{
        return SCREEN_HEIGHT -64-30-49;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (self.UserDic) {
        return 0;
    }else{
        return 30;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.UserDic) {
        return 80;
    }else{
        return 0;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (!self.UserDic) {
        LoadHeaderView *loginView = [[LoadHeaderView alloc] init];
        
        return loginView;
    }
    
    return nil;
    
}// custom view for header. will be adjusted to default or specified header height
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.UserDic) {
        FooterView *footerView = [[FooterView alloc] init];
        
        return footerView;
    }
    return nil;
    
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
    return 10;
}



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (!self.array) {
//        static NSString *CellLoad = @"LoadHeaderView";
//        static NSString *Cell = @"ShoppingCartCell";
//    }
//    
//    
//
//}


@end


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
    
    [self initRightButton];
}

- (void)initUI {

    self.title = @"购物车";
    //去掉tableView多余的空白行分割线
    self.tableVeiw.tableFooterView = [[UIView alloc] init];
    
//    self.UserDic = [[NSDictionary alloc] init];
    self.array = [[NSMutableArray alloc] init];

    self.tableVeiw.backgroundColor = [UIColor clearColor];
    [self.tableVeiw reloadData];
}

- (void)initRightButton {
    self.rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightButton setFrame:CGRectMake(0, 0, 60, 30)];
    [self.rightButton addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:self.rightButton ];
    
    UIBarButtonItem *negativeSpacer=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width=-17;
    self.navigationItem.rightBarButtonItems=@[negativeSpacer,rightItem];
}

- (void)initEditBtn {
    
    self.rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setTitle:@"完成" forState:UIControlStateNormal];
    self.rightButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.rightButton setFrame:CGRectMake(0, 0, 60, 30)];
    [self.rightButton addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:self.rightButton ];
    
    UIBarButtonItem *negativeSpacer=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width=-17;
    self.navigationItem.rightBarButtonItems=@[negativeSpacer,rightItem];
    
}

- (void)editBtnClick {
    NSLog(@"%s", __func__);
    
    [self initEditBtn];
}

- (void)completeBtnClick {
    NSLog(@"%s", __func__);
    
    [self initRightButton];
}

#pragma mark - TableView Delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     return UITableViewCellEditingStyleDelete;
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        //        [self.array removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
        //        [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.array) {
        return 90;
    }else{
        return SCREEN_HEIGHT -64-30-49-80;
    }
    return 0;
    
//    return SCREEN_HEIGHT -64-30-49-80;
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
    return 150;
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
//        if ([self.UserDic objectForKey:@"userId"]) {
    //        return 2;
    //    }else{
    //        if (self.array) {
    //            return 3;//loadCell、tableviewCell、footView
    //        }else{
    //            return 1;//loadCell、tableviewCell(nil)
    //        }
    //
//        }
    //    return 0;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//        if ([self.UserDic objectForKey:@"userId"]) {
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
//        }
    
    //    return [self.array count];
//    if (self.array) {
//        return 5;
//    }else{
//        return 1;
//    }
    return 5;
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
            [cell initWithDic:nil];
            
        }
        
        return cell;

    }
  
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end


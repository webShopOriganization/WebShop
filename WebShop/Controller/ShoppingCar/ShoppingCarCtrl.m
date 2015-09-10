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

@interface ShoppingCarCtrl ()<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate>


@end

@implementation ShoppingCarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"购物车";
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    
    
    if ([self.array count]) {
        
        [self initRightButton];
        [self initViewForTallyOrder];
        
        self.viewForTallyOrder.hidden = NO;
        self.viewSecond.hidden = YES;
    }else{
        self.viewForTallyOrder.hidden = YES;
        self.viewSecond.hidden = YES;
    }
    
}

- (void)initUI {

    self.title = @"购物车";
    //去掉tableView多余的空白行分割线
    self.tableVeiw.tableFooterView = [[UIView alloc] init];
 
    self.UserDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                    @"1" , @"userId",
                    @"小王" , @"username",
                    @"123" , @"password",
                    @"123456" , @"phone",
                    @"123456@qq.com" , @"email",
                    @"xx.png" , @"imgOfHead", nil];
    
    self.array = [[NSMutableArray alloc] initWithObjects:
                  @{@"productId": @"1", @"proName":@"A1", @"saleCount":@"1", @"image":@"", @"price":@"998.0", @"decript":@"good", @"salesDate":@"2015.06.22"},
                  @{@"productId": @"2", @"proName":@"B2", @"saleCount":@"1", @"image":@"", @"price":@"99.8", @"decript":@"good", @"salesDate":@"2015.02.03"},
                  @{@"productId": @"3", @"proName":@"C3", @"saleCount":@"1", @"image":@"", @"price":@"9.98", @"decript":@"good", @"salesDate":@"2015.05.04"},
//                  @{@"productId": @"4", @"proName":@"D4", @"saleCount":@"1", @"image":@"", @"price":@"199.0", @"decript":@"good", @"salesDate":@"2015.07.31"},
//                  @{@"productId": @"5", @"proName":@"E5", @"saleCount":@"1", @"image":@"", @"price":@"9999.0", @"decript":@"good", @"salesDate":@"2015.02.03"},
                  nil];
    
    [[NetworkManager shareMgr]server_productListWithDic:nil completeHandle:^(NSDictionary *response) {
        
    }];

    self.tableVeiw.backgroundColor = [UIColor clearColor];
    [self.tableVeiw reloadData];
}

- (void)initViewForTallyOrder {
   
    self.btnForChooseAll.layer.borderWidth = 1.0f;
    self.btnForChooseAll.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.btnForChooseAll.layer.cornerRadius = 10.0f;
    self.btnForChooseAll.layer.masksToBounds = YES;
        
    self.imgForBtnSelected.layer.cornerRadius = 10.0f;
    self.imgForBtnSelected.layer.masksToBounds = YES;

    self.lblAllPrice.text = @"合计￥0.00";
    
    self.btnSecond.layer.borderWidth = 1.0f;
    self.btnSecond.layer.borderColor = [[UIColor grayColor] CGColor];
    self.btnSecond.layer.cornerRadius = 10.0f;
    self.btnSecond.layer.masksToBounds = YES;
    
    self.btnDelete.layer.borderWidth = 1.0f;
    self.btnDelete.layer.borderColor = [[UIColor redColor] CGColor];
    self.btnDelete.layer.cornerRadius = 5.0f;
    self.btnDelete.layer.masksToBounds = YES;
    
    self.imgSecond.layer.cornerRadius = 10.0f;
    self.imgSecond.layer.masksToBounds = YES;
    


    
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
    
    self.viewForTallyOrder.hidden = YES;
    [self initEditBtn];
    self.viewSecond.hidden = NO;
    
}

- (void)completeBtnClick {
    NSLog(@"%s", __func__);
    
    self.viewSecond.hidden = YES;
    [self initRightButton];
    self.viewForTallyOrder.hidden = NO;
}

- (IBAction)deleteBtnClick:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确认要删除选中的商品吗？"
                                  delegate:self // telling this class(ViewController) to implement UIActionSheetDelegate
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                  otherButtonTitles:nil];
    
    [actionSheet showInView:self.tabBarController.view];
}

- (IBAction)btnSecondClick:(id)sender {
    if (self.imgSecond.hidden == YES) {
        self.imgSecond.hidden = NO;
    }else{
        self.imgSecond.hidden = YES;
    }
}

- (IBAction)btnPayMoney:(id)sender {
}

- (IBAction)btnChooseAllClick:(id)sender {
    if (self.imgForBtnSelected.hidden == YES) {
        self.imgForBtnSelected.hidden = NO;
    }else{
        self.imgForBtnSelected.hidden = YES;
    }
}




#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"删除商品操作");
        
        //        [self.tableView deleteRowsAtIndexPaths:<#(NSArray *)#> withRowAnimation:<#(UITableViewRowAnimation)#>];
        
    }else if (buttonIndex == 1){
        NSLog(@"取消删除");
    }
    
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    NSLog(@"取消删除商品");
}


#pragma mark - TableView Delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.tableVeiw]) {
        return UITableViewCellEditingStyleDelete;
    }
     return UITableViewCellEditingStyleNone;
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
        [self.array removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
        [self.tableVeiw beginUpdates];
        [self.tableVeiw deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        [self.tableVeiw endUpdates];
        
    }}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.array count]) {
        return 90;
    }else{
        return SCREEN_HEIGHT -64-30-49-80;
    }
    return 0;
    
//    return SCREEN_HEIGHT -64-30-49-80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    NSLog(@"id ======= %@", self.UserDic[@"userId"]);
    if (self.UserDic) {
        return 0;
    }else{
        return 30;
    }
    return 0;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.UserDic) {
        return 150;
    }else{
        return 0;
    }
    return 0;
  
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
    if (self.UserDic) {
        FooterView *footerView = [[FooterView alloc] init];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil];
        
        footerView = [topLevelObjects objectAtIndex:0];
    
        return footerView;
    }
    return nil;
    
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
    
    if (self.UserDic) {
        if ([self.array count]) {
            return [self.array count];
        }else{
            return 1;
        }
        
    }
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId = @"ShoppingCartCell";
    
    NSLog(@"self.array = %lu", (unsigned long)self.array.count);
    if (![self.array count]) {
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.textLabel.text = @"购物车是空的...";
        
        return cell;
        
    }else{
        
        NSMutableDictionary *dic = [self.array objectAtIndex:indexPath.row];
        NSLog(@"CellDic = %@", dic);
        ShoppingCartCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
            [cell initWithDic:nil];
            [cell configWithDic:dic];
            
        }
        
        return cell;

    }
  
    return nil;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end


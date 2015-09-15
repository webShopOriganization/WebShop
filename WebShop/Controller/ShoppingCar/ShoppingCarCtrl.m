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
#import "LoginViewController.h"
#import "PayForOrderCtrl.h"

@interface ShoppingCarCtrl ()<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, loginDelegate, deleteCellDelegate>

@property (assign, nonatomic) NSInteger statusForRightButton;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (assign, nonatomic) float totalPrice;
@property (strong, nonatomic) NSMutableArray *arrayDelete;
@property (strong, nonatomic) NSMutableArray *arrayPayOrder;
@end

@implementation ShoppingCarCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"购物车";
    [self initUI];
    
    self.imgForBtnSelected.hidden = YES;
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
    
    [self.tableVeiw reloadData];
    if (![self.array count]) {
        self.tableVeiw.backgroundColor = [UIColor lightGrayColor];
        [Common addAlertViewWithTitel:@"购物车是空的..."];
        
    }
    
}

- (void)initUI {

    self.title = @"购物车";
    //去掉tableView多余的空白行分割线
    self.tableVeiw.tableFooterView = [[UIView alloc] init];
 
//    self.UserDic = [[NSDictionary alloc] initWithObjectsAndKeys:
//                    @"1" , @"userId",
//                    @"小王" , @"username",
//                    @"123" , @"password",
//                    @"123456" , @"phone",
//                    @"123456@qq.com" , @"email",
//                    @"xx.png" , @"imgOfHead", nil];
    
    self.arrayDelete = [[NSMutableArray alloc] init];
    self.arrayPayOrder = [[NSMutableArray alloc] init];
    
    
    self.array = [[NSMutableArray alloc] initWithObjects:
                  @{@"productId": @"1", @"proName":@"华硕（ASUS）FL5600L 15.6英寸笔记本 （i7-5500U 4G 1TB 2G独显 蓝牙 Win8.1黑色）", @"saleCount":@"1", @"image":@"http://img12.360buyimg.com/n1/jfs/t1423/178/1078850293/141619/ccf1a50a/55b9fb36Na25baffa.jpg", @"price":@"4399.00", @"decript":@"华硕品质·坚若磐石", @"salesDate":@"2015.02.03"},
                  @{@"productId": @"2", @"proName":@"Apple iPhone 6 (A1586) 16GB 金色", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t277/193/1005339798/768456/29136988/542d0798N19d42ce3.jpg", @"price":@"4800.00", @"decript":@"移动联通电信4G手机", @"salesDate":@"2016.02.01"},
                  @{@"productId": @"3", @"proName":@"Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1270/246/1076044366/120025/3d6a9ae3/556d64fcNf28f90d0.jpg", @"price":@"5488.00", @"decript":@"选择下方“北京移动购机赠费”推荐188元套餐，不换号码，额外得1800元话费，分24个月返还，尖叫吧，机会难得，欲购从速！", @"salesDate":@"2016.02.01"},
                  @{@"productId": @"4", @"proName":@"小米 4 2GB内存版 白色 移动4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1339/269/193722734/56791/eb3cea86/555aec03Nc477b9b0.jpg", @"price":@"1499.00", @"decript":@"不锈钢金属边框、 5英寸屏窄边，工艺和手感超乎想象！", @"salesDate":@"2016.02.03"},
                  @{@"productId": @"5", @"proName":@"魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1270/246/1076044366/120025/3d6a9ae3/556d64fcNf28f90d0.jpg", @"price":@"999.00", @"decript":@"【超值套装版】", @"salesDate":@"2016.01.01"},
                  nil];
    
    [[NetworkManager shareMgr]server_productListWithDic:nil completeHandle:^(NSDictionary *response) {
        NSLog(@"购物车商品列表返回数据 : %@", response);
        
//        NSNumber *nStatus = [response objectForKey:@"status"];
//        if([nStatus intValue] == 2000000){
//            self.array = [[NSMutableArray alloc] initWithArray:[response objectForKey:@"data"]];
//            NSLog(@"购物车商品列表  : %@", self.array);
//        }

    }];

    self.tableVeiw.backgroundColor = [UIColor clearColor];

}

/**
 *  结算订单底部view初始化
 */
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
    
    self.statusForRightButton = 1;
    
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

- (void)initCompleteBtn {
    
    self.statusForRightButton = 2;
    
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

#pragma mark - button点击事件

- (void)editBtnClick {
    NSLog(@"%s", __func__);
    
    self.viewForTallyOrder.hidden = YES;
    self.imgForBtnSelected.hidden = YES;
    [self initCompleteBtn];
    self.viewSecond.hidden = NO;
    self.imgSecond.hidden = YES;
    [self.tableVeiw reloadData];
}

- (void)completeBtnClick {
    NSLog(@"%s", __func__);
    
    self.viewSecond.hidden = YES;
    [self initRightButton];
    self.viewForTallyOrder.hidden = NO;
    self.imgForBtnSelected.hidden = YES;
    
    [self.tableVeiw reloadData];
    
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

/**
 *  结算按钮点击事件
 */
- (IBAction)btnPayMoney:(id)sender {

//    if (!self.UserDic){
//        [Common addAlertViewWithTitel:@"请先登录"];
//    }else{
        PayForOrderCtrl *vc = [[PayForOrderCtrl alloc] initWithNibName:@"PayForOrderCtrl" bundle:nil];
        vc.navigationItem.title = @"支付方式";
    
        vc.arrayPay = self.arrayPayOrder;
    
        [self.navigationController pushViewController:vc animated:YES];
//    }
}

/**
 *  购物车结算界面全选按钮点击
 */
- (IBAction)btnChooseAllClick:(id)sender {
    
    float totalPrice = 0.0;
    
    if (self.imgForBtnSelected.hidden == YES) {
        self.imgForBtnSelected.hidden = NO;
        
        for (int i = 0; i < self.array.count; i++) {
            ShoppingCartCell *cell = (ShoppingCartCell *)[self.tableVeiw cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            cell.imgForBtnSeleted.hidden = NO;
            
            [self.arrayPayOrder addObject:[self.array objectAtIndex:i]];
            
            float price = [[[self.arrayPayOrder objectAtIndex:i] objectForKey:@"price"] floatValue];
            totalPrice = totalPrice + price;
            NSLog(@"totalPrice = %0.2f",totalPrice);
        }
        
        self.lblAllPrice.text = [NSString stringWithFormat:@"￥%0.2f", totalPrice];
        NSLog(@"shoppingcart.arrayPayOrder= %@", self.arrayPayOrder);
        
    }else{
        self.imgForBtnSelected.hidden = YES;
        
        for (int j = 0; j < self.array.count; j++) {
            ShoppingCartCell *cell = (ShoppingCartCell *)[self.tableVeiw cellForRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:0]];
            cell.imgForBtnSeleted.hidden = YES;
            
            [self.arrayPayOrder removeObject:[self.array objectAtIndex:j]];
            
        }
        self.lblAllPrice.text = @"合计￥0.00";
        NSLog(@"shoppingcart.arrayPayOrder = %@", self.arrayPayOrder);

    }
}

//删除界面全选按钮点击事件
- (IBAction)btnSecondClick:(id)sender {
    
    if (self.imgSecond.hidden == YES) {
        self.imgSecond.hidden = NO;
        
        for (int i = 0; i < self.array.count; i++) {
            ShoppingCartCell *cell = (ShoppingCartCell *)[self.tableVeiw cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
            cell.imgForBtnSeleted.hidden = NO;
            
            [self.arrayDelete addObject:[self.array objectAtIndex:i]];
        }
        NSLog(@"shoppingcart.arrayDelete = %@", self.arrayDelete);
        
    }else{
        self.imgSecond.hidden = YES;
        
        for (int j = 0; j < self.array.count; j++) {
            ShoppingCartCell *cell = (ShoppingCartCell *)[self.tableVeiw cellForRowAtIndexPath:[NSIndexPath indexPathForRow:j inSection:0]];
            cell.imgForBtnSeleted.hidden = YES;
            
            [self.arrayDelete removeObject:[self.array objectAtIndex:j]];
        }
        NSLog(@"shoppingcart.arrayDelete = %@", self.arrayDelete);
    }
}


#pragma mark - delegaete

- (void)JumpToLoginView:(NSDictionary *)loginDic {
    
    LoginViewController *vc=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    vc.navigationItem.title = @"用户登录";
    [self.navigationController pushViewController:vc animated:YES];

}

/**
 *  合计
 */
- (void)totalNeedPayFor:(NSIndexPath *)indexPath {
     NSLog(@"%s", __func__);
    self.indexPath = indexPath;
    
    float totalPrice = 0.0;

    if (self.statusForRightButton == 1 && (self.array.count != 0)) {
        
        for (int i =0; i < self.arrayPayOrder.count; i++) {
            float price = [[[self.arrayPayOrder objectAtIndex:i] objectForKey:@"price"] floatValue];
            totalPrice = totalPrice + price;
            
            NSLog(@"合计 = %0.2f", totalPrice);
        }
        self.lblAllPrice.text = [NSString stringWithFormat:@"￥%0.2f", totalPrice];
    }
    
    NSLog(@"待支付totalPay ： %@", self.lblAllPrice.text);
}
/**
 *  添加选中行到待支付数组
 */
- (void)addObjectToPayArray:(NSIndexPath *)indexPath {
    NSLog(@"添加indexpath ： %@", indexPath);
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 1 && (self.array.count != 0)) {
        
        [self.arrayPayOrder addObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayPayOrder = %@", self.arrayPayOrder);
        
        if (self.arrayPayOrder.count == self.array.count) {
            self.imgForBtnSelected.hidden = NO;
        }
    }
    
}

/**
 *  从待支付数组中移除选中行
 */
- (void)deleteFromPayArray:(NSIndexPath *)indexPath {
    NSLog(@"删除indexpath : %ld", (long)indexPath.row);
    self.imgForBtnSelected.hidden = YES;
    
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 1 && self.arrayPayOrder) {
       
        [self.arrayPayOrder removeObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayPayOrder = %@", self.arrayPayOrder);
    }

}

/**
 *  添加选中行到待删除数组
 */
-(void)addObjectToDeleteArray:(NSIndexPath *)indexPath {
    NSLog(@"添加indexpath ： %@", indexPath);
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 2 && (self.array.count != 0)) {
        
        [self.arrayDelete addObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayDelete = %@", self.arrayDelete);
        
        if (self.arrayDelete.count == self.array.count) {
            self.imgSecond.hidden = NO;
        }
    }
}

/**
 *  从待删除数组中移除
 */
- (void)deleteFromDeleteArray:(NSIndexPath *)indexPath {
    NSLog(@"删除indexpath : %ld", (long)indexPath.row);
    self.imgSecond.hidden = YES;
    
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 2 && self.arrayDelete) {
        
        [self.arrayPayOrder removeObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayDelete = %@", self.arrayDelete);
    }
}
#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"删除商品操作 arrayDelete: %lu , array :%lu", (unsigned long)[self.arrayDelete count], (unsigned long)[self.array count]);
        
        if (self.arrayDelete.count == self.array.count ) { //全选按钮显示
            [self.array removeAllObjects];
            [self.tableVeiw reloadData];
            [self.arrayDelete removeAllObjects];
            
            self.imgSecond.hidden = YES;
        }else{
            for (id obj in self.arrayDelete) {
                [self.array removeObject:obj];
            }
            NSLog(@"选中待删除的cell ： %@", self.arrayDelete);
            [self.tableVeiw reloadData];
            [self.arrayDelete removeAllObjects];//清空待删除数组内容
        }
        self.imgSecond.hidden = YES;
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
        
        [self.arrayPayOrder removeObject:[self.array objectAtIndex:[indexPath row]]];
        
        [self.array removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
//        [self.arrayPayOrder removeObjectAtIndex:[indexPath row]];
        
        [self.tableVeiw beginUpdates];
        [self.tableVeiw deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        [self.tableVeiw endUpdates];
        
        [self.tableVeiw reloadData];
        
        self.lblAllPrice.text = @"合计0.00";
        self.imgForBtnSelected.hidden = YES;
        self.imgSecond.hidden = YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.array count]) {
        return 90;
    }else{
        return 0;
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
    
    if (self.UserDic && [self.array count]) {
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
            
            loginView.delegate = self;
            
            return loginView;
        }
        
    }
    
    return nil;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (self.UserDic && [self.array count]) {
        FooterView *footerView = [[FooterView alloc] init];
        
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil];
        
        footerView = [topLevelObjects objectAtIndex:0];
    
        return footerView;
    }
    return nil;
    
}

#pragma mark - TableVeiw Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    if (self.UserDic) {
        if ([self.array count]) {
            return [self.array count];
        }else{
            return 0;
        }
//    }
//    return 0;
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
            
            cell.indexPath = indexPath;
            NSLog(@"--------%ld", (long)cell.indexPath.row);
            cell.delegate = self;
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


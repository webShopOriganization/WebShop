//
//  ShoppingCarCtrl.m
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ShoppingCarCtrl.h"
#import "Common.h"
#import "UserLoginInfo.h"
#import "UserDataManager.h"
#import "NetworkManager.h"
#import "LoadHeaderView.h"
#import "FooterView.h"
#import "ShoppingCartCell.h"
#import "LoginViewController.h"
#import "PayForOrderCtrl.h"
#import "DetailProdutCtrl.h"
#import "SecondFootView.h"
#import "OrderManageCtrl.h"
#import "DetailProdutCtrl.h"

@interface ShoppingCarCtrl ()<UITableViewDelegate, UITableViewDataSource, UIActionSheetDelegate, loginDelegate, deleteCellDelegate>

@property (assign, nonatomic) NSInteger statusForRightButton;
@property (assign, nonatomic) float totalPrice;
@property (assign) BOOL statusForFootView;
@property (assign) BOOL statusForCellChoose;

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (strong, nonatomic) NSMutableArray *arrayDelete;
@property (strong, nonatomic) NSMutableArray *arrayPayOrder;
@property (strong, nonatomic) UserLoginInfo *userLoginInfo;

@end

@implementation ShoppingCarCtrl

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView {
    
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";
    
//    [[NetworkManager shareMgr]server_loginWithDic:nil completeHandle:^(NSDictionary *response) {
//        NSLog(@"用户数据 : %@", response);
//        
//        NSNumber *nStatus = [response objectForKey:@"status"];
//        if([nStatus intValue] == 2000000){
//            self.UserDic = [[NSMutableDictionary alloc] initWithDictionary:[response objectForKey:@"data"]];
//            NSLog(@"用户信息 = %@", self.UserDic);
//        }
//        
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    [self getModel];
    [self initUI];
    self.navigationItem.rightBarButtonItem.title = @"编辑";
    self.firstBottomView.hidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];
    
    if (self.statusForBottomView == YES) {
        self.statusForBottomView = NO;
    }
    
    [self.firstBottomView removeFromSuperview];
    [self.secondBottomView removeFromSuperview];
    
}

- (void)getModel {
    
    self.userLoginInfo = [UserDataManager shareManager].userLoginInfo;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setValue:self.userLoginInfo.user.phone forKey:@"phone"];
    [dic setValue:self.userLoginInfo.sessionId forKey:@"sessionId"];
    
    NSLog(@"上传字典: %@", self.userLoginInfo);
    
    [[NetworkManager shareMgr]server_productListWithDic:nil completeHandle:^(NSDictionary *response) {
        NSLog(@"返回结果 : %@", response);
        
        NSNumber *nStatus = [response objectForKey:@"status"];
        if([nStatus intValue] == 2000000){
            
            self.array = [response objectForKey:@"data"];
            
            if (self.array.count == 0) {
                
                [Common addAlertViewWithTitel:@"购物车是空的..."];
            }
            
            [self.tableVeiw reloadData];
            NSLog(@"购物车内商品数 = %lu", (unsigned long)self.array.count);
            
        }else{
            
            [Common addAlertViewWithTitel:[response objectForKey:@"message"]];
        }
        
    }];
}

- (void)initUI {
    
    self.tabBarItem.title = @"购物车";
    //去掉tableView多余的空白行分割线
    self.tableVeiw.tableFooterView = [[UIView alloc] init];
    
    //self.statusForBottomView = NO;
    self.statusForRightButton = 1;
    self.totalPrice = 0.0f;
    self.statusForFootView = YES;
    self.statusForCellChoose = NO;
    
    //初始化底部支付view
    self.firstBottomView = [PayOrderView instanceView];
    NSLog(@"statusforBotton = %hhd", self.statusForBottomView);
    
    if (self.statusForBottomView == NO) {
        
        self.firstBottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height -49 -44, [UIScreen mainScreen].bounds.size.width, 44);
    }else{
        
        self.tableVeiw.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44);
        self.firstBottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height -44, [UIScreen mainScreen].bounds.size.width, 44);
    }
    
    [self.firstBottomView.btnForChooseAll addTarget:self action:@selector(btnChooseAllClick) forControlEvents:UIControlEventTouchUpInside];
    [self.firstBottomView.btnPayOrder addTarget:self action:@selector(btnPayMoneyClick) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.tabBarItem.title isEqualToString:@"购物车"]) {
        [self.tabBarController.view addSubview:self.firstBottomView];
        self.firstBottomView.hidden = YES;
    }
    
    //初始化底部删除view
    self.secondBottomView = [PayOrderDeleteView instanceView];
    
    
    if (self.statusForBottomView == NO) {
        
        self.secondBottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height -49 -44, [UIScreen mainScreen].bounds.size.width, 44);
    }else{
        
        self.tableVeiw.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44);
        self.secondBottomView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height -44, [UIScreen mainScreen].bounds.size.width, 44);
        
    }
    
    [self.secondBottomView.btnDelete addTarget:self action:@selector(deleteBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.secondBottomView.btnSecond addTarget:self action:@selector(btnForDeleteAll) forControlEvents:UIControlEventTouchUpInside];
    
    if ([self.tabBarItem.title isEqualToString:@"购物车"]) {
        
        [self.tabBarController.view addSubview:self.secondBottomView];
        self.secondBottomView.hidden = YES;
    }
    
    self.arrayDelete = [[NSMutableArray alloc] init];
    self.arrayPayOrder = [[NSMutableArray alloc] init];
    
    self.tableVeiw.backgroundColor = [UIColor clearColor];
    
    [self.tableVeiw reloadData];
}

#pragma mark - button点击事件

//改变footview显示状态
-  (void)changeStatus{
    
    self.statusForFootView = !self.statusForFootView;
    [self.tableVeiw reloadData];
}

//点击编辑按钮
- (IBAction)editBtnClick:(id)sender {
    NSLog(@"%s", __func__);
    if ([self.navigationItem.rightBarButtonItem.title isEqualToString:@"编辑"]) {
        
        self.statusForRightButton = 2;
        self.statusForCellChoose = NO;//点击编辑按钮，进入删除界面，cell选中状态设为NO
        [self.arrayDelete removeAllObjects];
        
        self.navigationItem.rightBarButtonItem.title = @"完成";
        
        self.firstBottomView.hidden = YES;
        self.secondBottomView.hidden = NO;
        self.secondBottomView.imgSecond.hidden = YES;
        
    }else{
        
        self.statusForRightButton = 1;
        self.statusForCellChoose = NO;//点击完成按钮，进入结算界面，cell选中状态设为NO
        [self.arrayPayOrder removeAllObjects];
        
        self.navigationItem.rightBarButtonItem.title = @"编辑";
        
        self.secondBottomView.hidden = YES;
        self.firstBottomView.hidden = NO;
        self.firstBottomView.imgForBtnSelected.hidden = YES;
        self.firstBottomView.lblAllPrice.text = @"合计￥0.00";
    }
    
    [self.tableVeiw reloadData];
}

/**
 *  结算按钮点击事件
 */
- (void)btnPayMoneyClick {
    
    //    if (self.arrayPayOrder) {
    PayForOrderCtrl *vc = [[PayForOrderCtrl alloc] initWithNibName:@"PayForOrderCtrl" bundle:nil];
    vc.navigationItem.title = @"支付方式";
    vc.arrayPay = self.arrayPayOrder;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    //    }
}

/**
 *  购物车结算界面全选按钮点击
 */
- (void)btnChooseAllClick {
    NSLog(@"%s", __func__);
    
    self.totalPrice = 0.0f;
    
    self.firstBottomView.lblAllPrice.text = @"合计￥0.00";
    
    if (self.firstBottomView.imgForBtnSelected.hidden == YES) {
        
        self.firstBottomView.imgForBtnSelected.hidden = NO;
        self.statusForCellChoose = YES;//选中状态
        
        [self.arrayPayOrder addObjectsFromArray:self.array];
        
        for (id obj in self.arrayPayOrder) {
            
            float price = [[obj objectForKey:@"price"] floatValue];
            self.totalPrice = self.totalPrice + price;
        }
        
        self.firstBottomView.lblAllPrice.text = [NSString stringWithFormat:@"合计￥%0.2f", self.totalPrice];
        NSLog(@"shoppingcart.arrayPayOrder= %@", self.arrayPayOrder);
        
    }else{
        
        self.firstBottomView.imgForBtnSelected.hidden = YES;
        self.statusForCellChoose = NO;
        
        [self.arrayPayOrder removeAllObjects];
        
        self.totalPrice = 0.0f;
        self.firstBottomView.lblAllPrice.text = @"合计￥0.00";
        NSLog(@"shoppingcart.arrayPayOrder = %@", self.arrayPayOrder);
    }
    [self.tableVeiw reloadData];
}

/**
 *  删除界面删除按钮
 */
- (void)deleteBtnClick{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确认要删除选中的商品吗？"
                                  delegate:self // telling this class(ViewController) to implement UIActionSheetDelegate
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"确定"
                                  otherButtonTitles:nil];
    
    [actionSheet showInView:self.tabBarController.view];
}

/**
 *  删除界面全选按钮
 */
- (void)btnForDeleteAll{
    if (self.secondBottomView.imgSecond.hidden == YES) {
        
        self.secondBottomView.imgSecond.hidden = NO;
          self.statusForCellChoose = YES;
        
        [self.arrayDelete addObjectsFromArray:self.array];

        NSLog(@"shoppingcart.arrayDelete = %lu", (unsigned long)self.arrayDelete.count);
        
    }else{
        
        self.secondBottomView.imgSecond.hidden = YES;
         self.statusForCellChoose = NO;
        
        [self.arrayDelete removeAllObjects];

        NSLog(@"shoppingcart.arrayDelete = %lu", (unsigned long)self.arrayDelete.count);
    }
    [self.tableVeiw reloadData];
}

#pragma mark - delegaete
/**
 *  跳转登录界面
 */
- (void)JumpToLoginView:(NSDictionary *)loginDic {
    
    LoginViewController *vc=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    vc.navigationItem.title = @"用户登录";
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 *  合计
 */
- (void)totalNeedPayFor:(NSIndexPath *)indexPath {
    NSLog(@"%s  arrayPayOrder = %@", __func__, self.arrayPayOrder);
    self.indexPath = indexPath;
    
    self.totalPrice = 0.0f;
    self.firstBottomView.lblAllPrice.text = @"合计￥0.00";
    
    if (self.statusForRightButton == 1 && (self.array.count != 0)) {
        
        for (int i =0; i < self.arrayPayOrder.count; i++) {
            float price = [[[self.arrayPayOrder objectAtIndex:i] objectForKey:@"price"] floatValue];
            self.totalPrice = self.totalPrice + price;
            
            NSLog(@"合计 = %0.2f", self.totalPrice);
        }
        self.firstBottomView.lblAllPrice.text = [NSString stringWithFormat:@"合计￥%0.2f", self.totalPrice];
    }
    
    NSLog(@"待支付totalPay ： %@", self.firstBottomView.lblAllPrice.text);
}

/**
 *  商品购买数量 +/- 1 所需费用
 */
- (void)saleCountAddOrDeleteOne:(float)changeMoney {
    NSLog(@"chagneMoney = %0.2f", changeMoney);
    
    if ([self.firstBottomView.lblAllPrice.text isEqualToString:@"合计￥0.00"]){
        self.totalPrice = changeMoney * 2;
    }else{
        self.totalPrice = self.totalPrice + changeMoney;
    }
    
    self.firstBottomView.lblAllPrice.text = [NSString stringWithFormat:@"合计￥%0.2f", self.totalPrice];
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
            self.firstBottomView.imgForBtnSelected.hidden = NO;
            self.statusForCellChoose = YES;
        }
    }
}

/**
 *  从待支付数组中移除选中行
 */
- (void)deleteFromPayArray:(NSIndexPath *)indexPath {
    NSLog(@"删除indexpath : %ld", (long)indexPath.row);
    
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 1 && self.arrayPayOrder) {
        
        [self.arrayPayOrder removeObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayPayOrder = %@", self.arrayPayOrder);
        
        if (self.arrayPayOrder.count != self.array.count) {
            self.firstBottomView.imgForBtnSelected.hidden = YES;
            self.statusForCellChoose = NO;
        }
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
        
        NSLog(@"self.arrayDelete = %lu", (unsigned long)self.arrayDelete.count);
        
        if (self.arrayDelete.count == self.array.count) {
            self.secondBottomView.imgSecond.hidden = NO;
            self.statusForCellChoose = YES;
        }
    }
}

/**
 *  从待删除数组中移除
 */
- (void)deleteFromDeleteArray:(NSIndexPath *)indexPath {
    NSLog(@"删除indexpath : %ld", (long)indexPath.row);
    
    self.indexPath = indexPath;
    
    if (self.statusForRightButton == 2 && self.arrayDelete) {
        
        [self.arrayDelete removeObject:[self.array objectAtIndex:self.indexPath.row]];
        
        NSLog(@"self.arrayDelete = %lu", (unsigned long)self.arrayDelete.count);
        
        if (self.arrayDelete.count != self.array.count) {
            self.secondBottomView.imgSecond.hidden = YES;
            self.statusForCellChoose = NO;
        }
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
            
            self.secondBottomView.imgSecond.hidden = YES;
        }else{
            for (id obj in self.arrayDelete) {
                [self.array removeObject:obj];
            }
            NSLog(@"选中待删除的cell ： %@", self.arrayDelete);
            [self.tableVeiw reloadData];
            [self.arrayDelete removeAllObjects];//清空待删除数组内容
        }
        self.secondBottomView.imgSecond.hidden = YES;
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
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.arrayPayOrder removeObject:[self.array objectAtIndex:[indexPath row]]];
        
        [self.array removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
//        [self.arrayPayOrder removeObjectAtIndex:[indexPath row]];
        
        [self.tableVeiw beginUpdates];
        [self.tableVeiw deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        [self.tableVeiw endUpdates];
        
        [self.tableVeiw reloadData];
        
        self.firstBottomView.lblAllPrice.text = @"合计￥0.00";
        self.firstBottomView.imgForBtnSelected.hidden = YES;
        self.secondBottomView.imgSecond.hidden = YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.array count]) {
        return 90;
    }else{
        return 0;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSLog(@"id ======= %@", self.UserDic[@"userId"]);
    if (self.UserDic) {
        return 0;
    }else{
        return 30
        ;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (self.statusForRightButton == 1) {
        if (self.statusForFootView == YES) {
            return 32;
        }else{
            return 160;
        }
    }
    else{
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
    if ([self.array count] && self.statusForRightButton == 1) {
        
        if (self.statusForFootView == YES) {
            SecondFootView *view = [[SecondFootView alloc] init];
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SecondFootView" owner:self options:nil];
            view = [topLevelObjects objectAtIndex:0];
            [view.btnDown addTarget:self action:@selector(changeStatus) forControlEvents:UIControlEventTouchUpInside];
            
            return view;
        }else{
            FooterView *view = [[FooterView alloc] init];
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil];
            view = [topLevelObjects objectAtIndex:0];
            
            NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
                                     @{@"productId": @"2", @"proName":@"Apple iPhone 6 (A1586) 16GB 金色", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t277/193/1005339798/768456/29136988/542d0798N19d42ce3.jpg", @"price":@"4800.00", @"decript":@"移动联通电信4G手机", @"salesDate":@"2016.02.01"},
                                     @{@"productId": @"3", @"proName":@"Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1270/246/1076044366/120025/3d6a9ae3/556d64fcNf28f90d0.jpg", @"price":@"5488.00", @"decript":@"选择下方“北京移动购机赠费”推荐188元套餐，不换号码，额外得1800元话费，分24个月返还，尖叫吧，机会难得，欲购从速！", @"salesDate":@"2016.02.01"},
                                     @{@"productId": @"4", @"proName":@"小米 4 2GB内存版 白色 移动4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1339/269/193722734/56791/eb3cea86/555aec03Nc477b9b0.jpg", @"price":@"1499.00", @"decript":@"不锈钢金属边框、 5英寸屏窄边，工艺和手感超乎想象！", @"salesDate":@"2016.02.03"}
                                     , nil];
            NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
            for (int i = 0; i < array.count; i ++) {
                dic = [array objectAtIndex:i];
                [view configWithDic:dic];
            }
            [view.btnUp addTarget:self action:@selector(changeStatus) forControlEvents:UIControlEventTouchUpInside];
            
            return view;
        }
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
    if (self.array.count == 0) {
//        self.tableVeiw.backgroundColor = [UIColor lightGrayColor];
        [Common addAlertViewWithTitel:@"购物车是空的..."];

        
    }else{
        
        NSMutableDictionary *dic = [self.array objectAtIndex:indexPath.row];
        NSLog(@"CellDic = %@", dic);
        ShoppingCartCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            
            cell.indexPath = indexPath;
            if (self.statusForCellChoose == YES) {
                cell.imgForBtnSeleted.hidden = NO;
            }
            
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
    NSLog(@"%s", __func__);
    
    DetailProdutCtrl *vc = [[DetailProdutCtrl alloc] initWithNibName:@"DetailProdutCtrl" bundle:nil];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end


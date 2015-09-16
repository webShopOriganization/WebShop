//
//  OrderManageCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderManageCtrl.h"
#import "NetworkManager.h"

@interface OrderManageCtrl ()<deleteOrder, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) NSIndexPath *indexPath;

@end

@implementation OrderManageCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
    self.navigationItem.title = @"全部订单";
    
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
//    [[NetworkManager shareMgr]server_OrderList:nil completeHandle:^(NSDictionary *response) {
//        NSLog(@"OrderList response = %@", response);
//        int status = [[response objectForKey:@"status"] intValue];
//        if (status == 2000000) {
//            
//            self.arrayOrder = [[NSMutableArray alloc ] initWithArray:[[response objectForKey:@"data"] objectForKey:@"product"]];
//            NSLog(@"self.arrayOrder = %@", self.arrayOrder);
//        }
//        
//    }];
   
    self.arrayOrder = [[NSMutableArray alloc] initWithObjects:
                       @{@"productId": @"1", @"proName":@"华硕（ASUS）FL5600L 15.6英寸笔记本 （i7-5500U 4G 1TB 2G独显 蓝牙 Win8.1黑色）", @"saleCount":@"1", @"image":@"http://img12.360buyimg.com/n1/jfs/t1423/178/1078850293/141619/ccf1a50a/55b9fb36Na25baffa.jpg", @"price":@"4399.00", @"decript":@"华硕品质·坚若磐石", @"salesDate":@"2015.02.03"},
                       @{@"productId": @"2", @"proName":@"Apple iPhone 6 (A1586) 16GB 金色", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t277/193/1005339798/768456/29136988/542d0798N19d42ce3.jpg", @"price":@"4800.00", @"decript":@"移动联通电信4G手机", @"salesDate":@"2016.02.01"},
                       @{@"productId": @"3", @"proName":@"Apple iPhone 6 Plus (A1524) 16GB 金色 移动联通电信4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1270/246/1076044366/120025/3d6a9ae3/556d64fcNf28f90d0.jpg", @"price":@"5488.00", @"decript":@"选择下方“北京移动购机赠费”推荐188元套餐，不换号码，额外得1800元话费，分24个月返还，尖叫吧，机会难得，欲购从速！", @"salesDate":@"2016.02.01"},
                       @{@"productId": @"4", @"proName":@"小米 4 2GB内存版 白色 移动4G手机", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1339/269/193722734/56791/eb3cea86/555aec03Nc477b9b0.jpg", @"price":@"1499.00", @"decript":@"不锈钢金属边框、 5英寸屏窄边，工艺和手感超乎想象！", @"salesDate":@"2016.02.03"},
                       @{@"productId": @"5", @"proName":@"魅族 魅蓝note2 16GB 白色 移动联通双4G手机 双卡双待", @"saleCount":@"1", @"image":@"http://img14.360buyimg.com/n1/jfs/t1270/246/1076044366/120025/3d6a9ae3/556d64fcNf28f90d0.jpg", @"price":@"999.00", @"decript":@"【超值套装版】", @"salesDate":@"2016.01.01"},
                       @{
                         @"productId": @"6", @"proName": @"【惠买车】宝马 X1订金499元 2015款 sDrive18i 时尚晋级版", @"saleCount": @"1", @"image":@"http://img11.360buyimg.com/n1/jfs/t733/135/1239145025/41477/9131c6df/5528c398Nbd1c2452.jpg", @"price":@"499.00", @"decript":@"钜惠金秋，买车无忧尽享新车专属大礼包！", @"salesDate":@"2016.04.01"
                         },
                       nil];


}

- (void)deleteOeder:(NSString *)orderID{
    NSLog(@"选中行: %ld, orderID = %@", (long)self.indexPath.row, orderID);
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确认删除此订单？"
                                  delegate:self // telling this class(ViewController) to implement UIActionSheetDelegate
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"删除"
                                  otherButtonTitles:nil];
    
    [actionSheet showInView:self.tabBarController.view];
}

- (void)sendIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row = %ld", (long)indexPath.row);

    self.indexPath = indexPath;
    
}

/** 确认删除订单 */
- (void)ConfirmDelete {
    NSLog(@"%s", __func__);
    
    [self.arrayOrder removeObjectAtIndex:self.indexPath.row];  //删除数组里的数据
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:self.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
    [self.tableView endUpdates];
    
    [self.tableView reloadData];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        NSLog(@"删除订单操作");
        
        [self ConfirmDelete];
        
    }else if (buttonIndex == 1){
        NSLog(@"取消删除");
    }
    
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet {
    NSLog(@"取消删除订单");
}
#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 90;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 30;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//
//    return 80;
//}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.tableView]) {
        return UITableViewCellEditingStyleDelete;
    }
    return UITableViewCellEditingStyleNone;
}
    //设置是否显示一个可编辑视图的视图控制器
//-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
//    [super setEditing:editing animated:animated];
//    //切换接收者的进入和退出编辑模式。
//    [self.tableView setEditing:editing animated:animated];
//}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

/*删除用到的函数*/
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.arrayOrder removeObjectAtIndex:[indexPath row]];  //删除数组里的数据
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
        [self.tableView endUpdates];

    }
}

#pragma mark - TableVeiw Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.arrayOrder count];
    return [self.arrayOrder count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellId = @"OrderManageCell";
    
    if ([self.arrayOrder count]) {
        
        NSMutableDictionary *dic = [self.arrayOrder objectAtIndex:indexPath.row];
        NSLog(@"OrderCellDic = %@", dic);
        
        OrderManageCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:CellId owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
            
            cell.indexPath = indexPath;
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

//
//  OrderManageCtrl.m
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/8.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "OrderManageCtrl.h"
#import "NetworkManager.h"
#import "OrderDetailCtrl.h"

@interface OrderManageCtrl ()<deleteOrder, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) NSIndexPath *indexPath;

@end

@implementation OrderManageCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.arrayOrder) {
        [self getModel];
    }

    NSLog(@"array = %@",self.arrayOrder);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getModel {
    
    self.navigationItem.title = @"全部订单";
    //去掉tableView多余的空白行分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [[NetworkManager shareMgr]server_OrderList:nil completeHandle:^(NSDictionary *response) {
        
        NSLog(@"OrderList response = %@", response);
        int status = [[response objectForKey:@"status"] intValue];
        if (status == 2000000) {
            
            self.arrayOrder = [[NSMutableArray alloc ] initWithArray:[response objectForKey:@"data"] ];
            [self.tableView reloadData];
            NSLog(@"self.arrayOrder.count = %lu", (unsigned long)self.arrayOrder.count);
        }
        
    }];
}

/** 添加actionsheet */
- (void)deleteOeder:(NSString *)orderID{
    NSLog(@"选中行: %ld, orderID = %@", (long)self.indexPath.row, orderID);
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"确认删除此订单？"
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:@"删除"
                                  otherButtonTitles:nil];
    
    [actionSheet showInView:self.tabBarController.view];
}

//delegate
- (void)sendIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath.row = %ld", (long)indexPath.row);

    self.indexPath = indexPath;
}

/** 确认删除订单 */
- (void)ConfirmDelete {
    NSLog(@"%s", __func__);
    
    [self.arrayOrder removeObjectAtIndex:self.indexPath.row];
    [self.tableView beginUpdates];
    [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:self.indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];  //删除对应数据的cell
    [self.tableView endUpdates];
    
    [self.tableView reloadData];
}

/**
 *  跳转到订单详情界面
 */
- (void)jumpToOrderDetail:(NSIndexPath *)indexPath {
    NSLog(@"第 %ld 行",(long)indexPath.row);
    
    NSMutableDictionary *dic = [self.arrayOrder objectAtIndex:indexPath.row];
    
    OrderDetailCtrl *vc = [[OrderDetailCtrl alloc] initWithNibName:@"OrderDetailCtrl" bundle:nil];
    vc.navigationItem.title = @"订单详情";
    vc.dict = dic;
    [self.navigationController pushViewController:vc animated:YES];
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

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView isEqual:self.tableView]) {
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
            cell.btn_Orderdetails.tag = indexPath.row;
            
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

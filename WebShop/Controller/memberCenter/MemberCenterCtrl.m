//
//  MemberCenterCtrl.m
//  WebShop
//
//  Created by walter on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "MemberCenterCtrl.h"
#import "memberCell.h"
#import "MemberCenterCtrl.h"

@interface MemberCenterCtrl ()

@end

@implementation MemberCenterCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title=@"会员中心";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma tableble datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* CellId = @"memberCell";
    
   
        memberCell* cell = [tableView dequeueReusableCellWithIdentifier:CellId];
        
        if (!cell) {
            
            NSArray* topObjects = [[NSBundle mainBundle] loadNibNamed:CellId owner:self options:nil];
            
            cell = [topObjects objectAtIndex:0];
            
        }
    
    if (indexPath.section==0) {
        cell.lblTitle.text=@"订单管理";
    }
        
        return cell;
    
}


- (CGFloat)tableView:(UITableView * )tableView
heightForHeaderInSection:(NSInteger)section
{
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc] init];
    headView.backgroundColor=[UIColor clearColor];
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
//        MemberCenterCtrl *vc = [[MemberCenterCtrl alloc] initWithNibName:@"MemberCenterCtrl" bundle:nil];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        MemberCenterCtrl *vc = [storyboard instantiateViewControllerWithIdentifier:@"MemberCenterCtrl"];
        
        vc.navigationItem.title = @"订单管理";
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
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

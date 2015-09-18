//
//  DetailProdutCtrl.m
//  WebShop
//
//  Created by walter on 15/9/11.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "DetailProdutCtrl.h"
#import "CommonCell.h"
#import "CommentDetailCell.h"
#import "LookAllCommentCell.h"
#import "ServiceInfoCell.h"
#import "MapController.h"
#import "REFrostedViewController.h"
#import "UIView+REFrostedViewController.h"
#import "GetCityCtrl.h"
//#import "GetProvinceCtrl.h"
#import "ProvinceCtrl.h"
#import "AdvertisementCell.h"
#import "PriceCell.h"
#import "SalesPromotionCell.h"
#import "PriceCell.h"
#import "NetworkManager.h"
#import "CommentDetailCell.h"
#import "SalesPromotionSecondCell.h"
#import "starView.h"
#import "LookAllCommentCell.h"
#import "ParserDataManager.h"
#import "CommentCtrl.h"
#import "PopupView.h"
#import "LewPopupViewAnimationSpring.h"

@interface DetailProdutCtrl ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *arrayOfData;
@property (nonatomic,strong) NSMutableArray *array_advertisement;
@property (assign) BOOL JudgeExpand;
@end

@implementation DetailProdutCtrl

-(void)awakeFromNib
{
    
    
   
}

-(void)getNotif
{
    NSLog(@"通知");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arrayOfData=[[NSMutableArray alloc]initWithObjects:@"1",@"2", nil];
    self.array_advertisement=[[NSMutableArray alloc]initWithObjects:@"bg1",@"bg2",@"bg3", nil];
    self.JudgeExpand=NO;
    
    self.navigationItem.title=@"商品详情";
    
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{

    [self.tableView reloadData];
}

-(void)initUI
{
    _sideSlipView = [[JKSideSlipView alloc]initWithSender:self];
    _sideSlipView.backgroundColor = [UIColor redColor];
    MenuView *menu = [MenuView menuView];
    [menu didSelectRowAtIndexPath:^(id cell, NSIndexPath *indexPath) {
        self.navigationController.navigationBarHidden=NO;
    }];
    menu.items = @[@{@"title":@"1",@"imagename":@"1"},@{@"title":@"2",@"imagename":@"2"},@{@"title":@"3",@"imagename":@"3"},@{@"title":@"4",@"imagename":@"4"}];
    [_sideSlipView setContentView:menu];
    [self.view addSubview:_sideSlipView];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"showNavigationBar" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {

        self.navigationController.navigationBarHidden=NO;
    }];
    

    [[NSNotificationCenter defaultCenter] addObserverForName:@"adress" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {

        ServiceInfoCell *cell=(ServiceInfoCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:3]];
        cell.lblLocation.text=note.object;
        
        [self.tableView reloadData];
    }];
}

- (void)getModel
{
    [[NetworkManager shareMgr] server_fetchAdvertisementWithDic:nil completeHandle:^(NSDictionary *responseBanner) {
        
        self.array_advertisement = [[responseBanner objectForKey:@"data"] objectForKey:@"items"];
    }];
    
    
}

#pragma mark - Table view data source

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* advertiseTitle=@"AdvertisementCell";
    static NSString* commonTitle=@"CommonCell";
    static NSString* serviceInfoTitle=@"ServiceInfoCell";
    static NSString* salesPromotionTitle=@"SalesPromotionCell";
    static NSString* priceTitle=@"PriceCell";
    static NSString* salesPromotionSecondTitle=@"SalesPromotionSecondCell";
    static NSString* commentDetailTitle=@"CommentDetailCell";
    static NSString* lookAllCommentTitle=@"LookAllCommentCell";
    
    
    if (indexPath.section==0) {
        AdvertisementCell* cell = [tableView dequeueReusableCellWithIdentifier:advertiseTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"AdvertisementCell" owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        [cell customUI:self.array_advertisement];
        
        return cell;
    }
    else if (indexPath.section==1)
    {
        PriceCell* cell = [tableView dequeueReusableCellWithIdentifier:priceTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"PriceCell" owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        
        return cell;
        
    }
    
    else if (indexPath.section==2)
    {
        if (self.JudgeExpand) {
            SalesPromotionSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:salesPromotionSecondTitle];
            if (!cell) {
                
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SalesPromotionSecondCell" owner:self options:nil];
                
                cell = [topLevelObjects objectAtIndex:0];
            }
            [cell.btnExpand addTarget:self action:@selector(doExpand) forControlEvents:UIControlEventTouchUpInside];
            
            return cell;
        }
        else
        {
            SalesPromotionCell* cell = [tableView dequeueReusableCellWithIdentifier:salesPromotionTitle];
            if (!cell) {
                
                NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SalesPromotionCell" owner:self options:nil];
                
                cell = [topLevelObjects objectAtIndex:0];
            }
            
            return cell;
        }
        
        

    }
    
   else if (indexPath.section==3) {
       
       ServiceInfoCell* cell = [tableView dequeueReusableCellWithIdentifier:serviceInfoTitle];
       if (!cell) {
           
           NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"ServiceInfoCell" owner:self options:nil];
           
           cell = [topLevelObjects objectAtIndex:0];
       }
       [cell.btnLocation addTarget:self action:@selector(goToMap:) forControlEvents:UIControlEventTouchUpInside];
       cell.lblLocation.text=[ParserDataManager shareManager].adress;
       
       [cell.btnAlert addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
       [cell.btnHasBuy addTarget:self action:@selector(showHasBuy:) forControlEvents:UIControlEventTouchUpInside];
       
       return cell;
       
       
    }
    else if (indexPath.section==4)
    {
        CommonCell* cell = [tableView dequeueReusableCellWithIdentifier:commonTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CommonCell" owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
   else if (indexPath.section==5)
   {
       
       CommentDetailCell* cell = [tableView dequeueReusableCellWithIdentifier:commentDetailTitle];
       if (!cell) {
           
           NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CommentDetailCell" owner:self options:nil];
           
           cell = [topLevelObjects objectAtIndex:0];
       }
       return cell;
   }
    else
    {
        
        LookAllCommentCell* cell = [tableView dequeueReusableCellWithIdentifier:lookAllCommentTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"LookAllCommentCell" owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
    
    
    
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 209;
    }
    else if (indexPath.section==1)
    {
        return 164;
    }
    else if (indexPath.section==2)
    {
        if (self.JudgeExpand) {
            return 196;
        }
        else
        {
        return 91;
        }
        
        
    }
    else if (indexPath.section==3)
    {
        return 240;
    }
    else if (indexPath.section==4)
    {
        return 65;
    }
    else if (indexPath.section==5)
    {
        return 142;
    }
    else
    {
        return 44;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        
        if (!self.JudgeExpand) {
            self.JudgeExpand=!self.JudgeExpand;
            [self.tableView reloadData];
        }
        
    }
    else if (indexPath.section==4||indexPath.section==5||indexPath.section==6)
    {
        CommentCtrl *vc=[[CommentCtrl alloc]initWithNibName:@"CommentCtrl" bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)showAlert:(UIButton*)button
{
    
    PopupView *view = [PopupView defaultPopupView];
    view.parentVC = self;
    
    [self lew_presentPopupView:view animation:[LewPopupViewAnimationSpring new] dismissed:^{
       
    }];
}

-(void)showHasBuy:(UIButton*)button
{
    NSLog(@"she");
    
    self.navigationController.navigationBarHidden=YES;
    
     [_sideSlipView switchMenu];
}


-(void)doExpand
{
    self.JudgeExpand=!self.JudgeExpand;
    [self.tableView reloadData];
}

-(void)goToMap:(UIButton*)button
{
//    MapController *vc=[[MapController alloc]initWithNibName:@"MapController" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
    

    
    [self.frostedViewController presentMenuViewController];
    
//    UIStoryboard *story=[UIStoryboard storyboardWithName:@"ProductDetail" bundle:nil];
//    ProvinceCtrl *vc = [story instantiateViewControllerWithIdentifier:@"ProvinceCtrl"];
//    [self.navigationController pushViewController:vc animated:YES];
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

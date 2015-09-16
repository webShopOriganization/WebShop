//
//  ProvinceCtrl.m
//  WebShop
//
//  Created by lijingyou on 15/9/13.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "ProvinceCtrl.h"
#import "ProvinceCell.h"
#import "GetCityCtrl.h"
//#import "HKMapManager.h"
#import "ParserDataManager.h"
#import "REFrostedViewController.h"
#import "UIView+REFrostedViewController.h"
#import "DetailProdutCtrl.h"

@interface ProvinceCtrl ()<REFrostedViewControllerDelegate>

@property (strong,nonatomic)NSMutableArray *arrayOfData;
@property (strong,nonatomic) NSMutableArray *arrayOfProvince;
@property (strong,nonatomic) NSMutableArray *arrayOfCity;
@property (strong,nonatomic) NSMutableArray *arrayOfRegion;
@property (strong,nonatomic) NSString *province;
@property (strong,nonatomic) NSString *city;
@property (strong,nonatomic) NSString *region;

@property (assign,nonatomic) int value;


@end

@implementation ProvinceCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"选择省份";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    self.value=0;
    self.province=@"";
    self.city=@"";
    
    self.arrayOfData=[[NSMutableArray alloc]init];
    self.arrayOfData=[ParserDataManager shareManager].arrayOfProvince;
    [self.tableView reloadData];
}



#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayOfData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellId = @"ProvinceCell";
    
    
    ProvinceCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:cellId owner:self options:nil] objectAtIndex:0];
        
    }
    
    cell.lbl_province.text = [self.arrayOfData objectAtIndex:indexPath.row];
    
    return cell;
    
}


- (CGFloat)tableView:(UITableView * )tableView
heightForHeaderInSection:(NSInteger)section
{
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.value == 0) {

        ProvinceCell *cell=(ProvinceCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        
        self.province=cell.lbl_province.text;
        
        NSMutableArray *array=[[NSMutableArray alloc]init];
        
        for (int i=0; i<[ParserDataManager shareManager].arrayOfCity.count; i++) {
            if ([[[ParserDataManager shareManager].arrayOfCity objectAtIndex:i] hasPrefix:cell.lbl_province.text]) {
                
                NSString* str = [[ParserDataManager shareManager].arrayOfCity objectAtIndex:i];
                
                NSString* strCity = [str substringFromIndex:cell.lbl_province.text.length];
                
                [array addObject:strCity];
            }
        }
        
        self.arrayOfData=array;
        self.arrayOfCity=[[NSMutableArray alloc]init];
        self.arrayOfCity=self.arrayOfData;
        self.value=1;
        [self.tableView reloadData];
    }
    else if(self.value == 1)
    {
      
        ProvinceCell *cell=(ProvinceCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        
        self.city=cell.lbl_province.text;
        NSMutableArray *arrayBefore=[[NSMutableArray alloc]init];
        
        for (int i=0; i<[ParserDataManager shareManager].arrayOfRegion.count; i++) {
            
            
            if ([[[ParserDataManager shareManager].arrayOfRegion objectAtIndex:i] hasPrefix:self.province]) {
                NSString* str = [[ParserDataManager shareManager].arrayOfRegion objectAtIndex:i];
                
                NSString* strCity = [str substringFromIndex:self.province.length];
                
                [arrayBefore addObject:strCity];
            }
        }
        
        
        NSMutableArray *array=[[NSMutableArray alloc]init];
        
        for (int i=0; i<arrayBefore.count; i++) {
  
                
                if ([[arrayBefore objectAtIndex:i] hasPrefix:cell.lbl_province.text]) {
                    NSString* str = [arrayBefore objectAtIndex:i];
                    
                    NSString* strCity = [str substringFromIndex:cell.lbl_province.text.length];
                    
                    [array addObject:strCity];
                }
        }
        
        if (array.count==0) {
            NSString *string=[NSString stringWithFormat:@"%@ %@",self.province,self.city];
            [ParserDataManager shareManager].adress=string;
            [[ParserDataManager shareManager] writeAdressData];
            
            [self.frostedViewController hideMenuViewController];
            
        }
        else
        {
            self.arrayOfData=array;
            self.value=2;
            [self.tableView reloadData];
        }
        
        
    }
    else if (self.value==2)
    {
        
        ProvinceCell *cell=(ProvinceCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
        self.region=cell.lbl_province.text;
        NSString *string=[NSString stringWithFormat:@"%@ %@ %@",self.province,self.city,self.region];
        
        [ParserDataManager shareManager].adress=string;
        [[ParserDataManager shareManager] writeAdressData];
        
        [self.frostedViewController hideMenuViewController];
        
    }
    
    
}

@end

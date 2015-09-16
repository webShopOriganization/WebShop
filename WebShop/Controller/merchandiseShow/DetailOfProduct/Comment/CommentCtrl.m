//
//  CommentCtrl.m
//  WebShop
//
//  Created by walter on 15/9/15.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "CommentCtrl.h"
#import "Common.h"
#import "CommentInformationCell.h"



@interface CommentCtrl ()
@property (strong,nonatomic)UIScrollView *scrollView;
@property (nonatomic, strong) UIView* slideView;
@property (nonatomic,strong) NSMutableArray *arrayOfData;
@property (nonatomic,strong) NSMutableArray *arrayOfImage;

@end

@implementation CommentCtrl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"评论";
    self.arrayOfData=[[NSMutableArray alloc]init];
    self.arrayOfImage=[[NSMutableArray alloc]initWithObjects:@"bg1",@"bg2",@"bg3",@"bg1",@"bg2", nil];
    
    [self initScrollTables:5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initScrollTables:(NSInteger)tableCount
{
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*tableCount, self.scrollView.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.hidden = YES;
    
    for (int i = 0; i < tableCount ; i ++) {
        
//        UITableView* tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH,SCREEN_HEIGHT-64 - 44) style:UITableViewStylePlain];
//        
//        tableView.tag = i;
//        
//        tableView.delegate = self;
//        tableView.dataSource = self;
//        
//        [self.view addSubview:tableView];
//        
//        if (tableView.tag != 0) {
//            
//            tableView.hidden = YES;
//        }
//        
//        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
       // [self.arrayOfTables addObject:tableView];
        
        NSArray* array = [NSArray arrayWithObjects:@"全部评论",@"好评",@"中评",@"差评",@"有图", nil];
        
        UIButton* btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
        
        btn.frame = CGRectMake( (SCREEN_WIDTH/tableCount)*i, 0, SCREEN_WIDTH/tableCount, 44);
                //btn.backgroundColor = [UIColor blueColor];
        btn.tag = i;
        
        btn.titleLabel.font=[UIFont systemFontOfSize:15.0];
        
        
        
        if (i != 0) {
            
            [btn setTitleColor:[UIColor grayColor]  forState:UIControlStateNormal];
            
        }else{
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        [btn addTarget:self action:@selector(jumpToTable:) forControlEvents:UIControlEventTouchUpInside];
        
        self.viewSelect.backgroundColor=[UIColor whiteColor];
        [self.viewSelect addSubview:btn];
    }
    
    
    UIView* divideView = [[UIView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 1)];
    divideView.backgroundColor = [UIColor clearColor];
    
    [self.viewSelect addSubview:divideView];
    
    self.slideView = [[UIView alloc] initWithFrame:CGRectMake(0, 42, SCREEN_WIDTH/tableCount, 2)];
    self.slideView.backgroundColor = [UIColor grayColor];
    
    [self.viewSelect addSubview:self.slideView];
     
    
    
}


- (void)jumpToTable:(UIButton*)btn
{
    NSInteger index = btn.tag;
    
    /*
    for (UITableView* table in [self.view  subviews]) {
        
        if (![[table class] isSubclassOfClass:[UITableView class]]) {
            
            continue;
        }
        
        if (table.tag == index) {
            
//            if (index==0) {
//                self.arrayOfShow=self.arrayOfOrder;
//                [table reloadData];
//            }
//            else if (index==1)
//            {
//                self.arrayOfShow=self.arrayOfWaiting;
//                [table reloadData];
//            }
//            else if (index==2)
//            {
//                self.arrayOfShow=self.arrayOfServicing;
//                [table reloadData];
//            }
//            else if (index==3)
//            {
//                self.arrayOfShow=self.arrayOfComplete;
//                [table reloadData];
//            }
//            else if (index==4)
//            {
//                self.arrayOfShow=self.arrayOfCancel;
//                [table reloadData];
//            }
            
            table.hidden = NO;
            
        }else{
            
            table.hidden = YES;
        }
        
    }
    */
    
    for (UIButton* btn  in [self.viewSelect subviews]) {
        
        if (![[btn class] isSubclassOfClass:[UIButton class]] ) {
            
            continue;
        }
        
        
        if (btn.tag == index) {
            
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            
        }else{
            
            [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            
        }
        
        
    }
    
    [UIView beginAnimations:@"slider" context:nil];
    [UIView setAnimationDuration:0.5];
    
    self.slideView.frame = CGRectMake(btn.tag*(SCREEN_WIDTH/5), 42, SCREEN_WIDTH/5, 2);
    
    
    [UIView commitAnimations];
    
        [self.scrollView scrollRectToVisible:CGRectMake(index*SCREEN_WIDTH, 0, SCREEN_WIDTH, self.scrollView.frame.size.height) animated:YES];
}

#pragma mark - Table view data source

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* commentInfoTitle=@"CommentInformationCell";

        CommentInformationCell* cell = [tableView dequeueReusableCellWithIdentifier:commentInfoTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CommentInformationCell" owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
    
    for (int i=0; i<self.arrayOfImage.count; i++) {
        
        [cell.dynamicScrollView addImageView:[UIImage imageNamed:[self.arrayOfImage objectAtIndex:i]]];
    }
    
    cell.BtnAgree.layer.borderWidth=0.5;
    cell.BtnAgree.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    cell.BtnComment.layer.borderWidth=0.5;
    cell.BtnComment.layer.borderColor=[UIColor lightGrayColor].CGColor;
        return cell;
       
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]init];
    view.backgroundColor=[UIColor clearColor];
    return view;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 257;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
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

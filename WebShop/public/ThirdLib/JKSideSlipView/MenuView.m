//
//  MenuView.m
//  JKSideSlipView
//
//  Created by Jakey on 15/1/10.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "MenuView.h"
#import "MenuCell.h"
#import "MenuVersionCell.h"
#import "MenuNumCell.h"

@implementation MenuView

-(void)awakeFromNib
{
    [self.btnAddToCar setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-43, 250, 43)];
}

+(instancetype)menuView
{
    UIView *result = nil;

    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    
    
    for (id object in nibView)
    {
        if ([object isKindOfClass:[self class]])
        {
            result = object;
            
            break;
        }
    }
    return result;
}

-(void)didSelectRowAtIndexPath:(void (^)(id cell, NSIndexPath *indexPath))didSelectRowAtIndexPath{
    _didSelectRowAtIndexPath = [didSelectRowAtIndexPath copy];
}
-(void)setItems:(NSArray *)items{
    _items = items;
}


#pragma -mark tableView Delegates

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [_items count];
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row==0) {
        return 79;
    }
    else if (indexPath.row==1)
    {
        return 91;
    }
    else if (indexPath.row==2)
    {
        return 92;
    }
    
    return 90;
}

/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_didSelectRowAtIndexPath) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        _didSelectRowAtIndexPath(cell,indexPath);
    }
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
}
 */

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString* menuTitle=@"MenuCell";
    static NSString* menuVersionTitle=@"MenuVersionCell";
    static NSString* menuNumTitle=@"MenuNumCell";
    
    if (indexPath.row==0) {
        MenuCell* cell = [tableView dequeueReusableCellWithIdentifier:menuTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:menuTitle owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
    else if (indexPath.row==1)
    {
        MenuVersionCell* cell = [tableView dequeueReusableCellWithIdentifier:menuVersionTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:menuVersionTitle owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
    else if (indexPath.row==2)
    {
        MenuNumCell* cell = [tableView dequeueReusableCellWithIdentifier:menuNumTitle];
        if (!cell) {
            
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:menuNumTitle owner:self options:nil];
            
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
    
    
    
    return nil;
    
    /*
    [self.myTableView registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
    MenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    cell.lable.text = [self.items[indexPath.row] objectForKey:@"title"];
    cell.icon.image = [UIImage imageNamed:[self.items[indexPath.row] objectForKey:@"imagename"]];
    return cell;
     */
}


@end

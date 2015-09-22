//
//  CollectionCell.h
//  CollectionTest
//
//  Created by chutong-mini-201401 on 15/9/22.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgIcon;
@property (strong, nonatomic) IBOutlet UILabel *lblName;

- (void)initWithDic:(NSMutableDictionary*)dic;
- (void)configWithDic:(NSMutableDictionary*)dic;

@end

//
//  CollectionCtrl.h
//  WebShop
//
//  Created by chutong-mini-201401 on 15/9/22.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionCtrl : UIViewController
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@property (strong, nonatomic) NSMutableArray *arrayCollection;
@end

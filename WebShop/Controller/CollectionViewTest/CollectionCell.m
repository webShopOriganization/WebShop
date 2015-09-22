//
//  CollectionCell.m
//  CollectionTest
//
//  Created by chutong-mini-201401 on 15/9/22.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "CollectionCell.h"
#import "SDWebImageManager.h"
#import "UIImageView+WebCache.h"

@implementation CollectionCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        //初始化时加载collectionCell.xib文件
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionCell" owner:self options:nil];
        
        //如果路径不存在，return nil
        if (arrayOfViews.count < 1) {
            return nil;
        }
        
        //如果xib中view不属于UICollectionVeiwCell类，return nil
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        //加载nib
        self = [arrayOfViews objectAtIndex:0];
    }
    return self;
}

- (void)initWithDic:(NSMutableDictionary*)dic {
    
    self.imgIcon.layer.cornerRadius = 5.0f;
    self.imgIcon.layer.borderWidth = 1.0f;
    self.imgIcon.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.imgIcon.layer.masksToBounds = YES;

}

- (void)configWithDic:(NSMutableDictionary*)dic {
    
    self.lblName.text = dic[@"proName"];

    [self.imgIcon sd_setImageWithURL:dic[@"image"]
                       placeholderImage:[UIImage imageNamed:@"loading-ios"] options:SDWebImageContinueInBackground];
}

@end

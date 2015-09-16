//
//  Common.h
//  WebShop
//
//  Created by lijingyou on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define DOCTOR_RECOMMEND_RATIO 169/320
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height) 

@interface Common : NSObject

//json转成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+(void)addAlertViewWithTitel:(NSString*)string;
+ (UIColor *) getColor: (NSString *) hexColor;

+ (UIColor*)getColor:(NSString *)hexColor WithAlpha:(CGFloat)alpha;

@end

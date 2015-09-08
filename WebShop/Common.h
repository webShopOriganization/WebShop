//
//  Common.h
//  WebShop
//
//  Created by lijingyou on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Common : NSObject

//json转成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

+(void)addAlertViewWithTitel:(NSString*)string;

@end

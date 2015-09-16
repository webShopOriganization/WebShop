//
//  Common.m
//  WebShop
//
//  Created by lijingyou on 15/9/7.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import "Common.h"
#import "iToast.h"

@implementation Common

//json转成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString==nil) {
        return nil;
    }
    
    NSData *jsonData=[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    
    if (err) {
        NSLog(@"json解析失败:%@",err);
        return nil;
    }
    return dic;
}

+(void)addAlertViewWithTitel:(NSString*)string
{
    iToastSettings *theSettings=[iToastSettings getSharedSettings];
    
    [theSettings setDuration:iToastDurationNormal];
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        [[iToast makeText:string]show];
    });
}

// Convert a 6-character hex color to a UIColor object
+ (UIColor *) getColor: (NSString *) hexColor
{
    //    NSLog(@"hexColorClass = %d",[hexColor intValue]);
    //    NSLog(@"要处理的hexColor = %@",hexColor);
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:1.0f];
    
}

+ (UIColor*)getColor:(NSString *)hexColor WithAlpha:(CGFloat)alpha
{
    
    unsigned int red, green, blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green/255.0f) blue:(float)(blue/255.0f) alpha:alpha];
    
}

@end

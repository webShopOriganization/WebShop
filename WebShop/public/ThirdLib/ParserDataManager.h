//
//  ParserDataManager.h
//  WebShop
//
//  Created by lijingyou on 15/9/13.
//  Copyright (c) 2015年 chutong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParserDataManager : NSObject

@property (strong,nonatomic) NSMutableArray *arrayOfProvince;
@property (strong,nonatomic) NSMutableArray *arrayOfCity;
@property (strong,nonatomic) NSMutableArray *arrayOfRegion;
@property (strong,nonatomic) NSString *adress;

+ (ParserDataManager*)shareManager;

- (void)writeProvinceData;
- (void)readProvinceData;

- (void)writeCityData;
- (void)readCityData;

- (void)writeRegionData;
- (void)readRegionData;

- (void)writeAdressData;
- (void)readAdressData;

@end

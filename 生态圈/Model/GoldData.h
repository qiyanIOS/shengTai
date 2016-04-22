//
//  GoldData.h
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoldData : NSObject
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSString* imageStr;
@property(nonatomic,strong)NSString* hotelTitle;
+(NSArray*)titleArray;
+(NSArray*)travelArray;
+(NSArray*)othreArray;
+(NSArray*)allArray;

@end

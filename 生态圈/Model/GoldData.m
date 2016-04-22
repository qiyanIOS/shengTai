//
//  GoldData.m
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GoldData.h"

@implementation GoldData
+(NSArray*)titleArray
{
    //NSArray*array=@[@"酒店",@"攻略",@"鉴证",@"周边",@"门票",@"机票",@"火车票",@"汽车票"];
    GoldData* data=[GoldData new];
    data.title=@"酒店";
    GoldData* data1=[GoldData new];
    data1.title=@"攻略";
    GoldData* data2=[GoldData new];
    data2.title=@"签证";
    GoldData* data3=[GoldData new];
    data3.title=@"周边";
    GoldData* data4=[GoldData new];
    data4.title=@"门票";
    GoldData* data5=[GoldData new];
    data5.title=@"机票";
    GoldData* data6=[GoldData new];
    data6.title=@"火车票";
    GoldData* data7=[GoldData new];
    data7.title=@"汽车票";
    return @[data,data1,data2,data3,data4,data5,data6,data7];
    
}
+(NSArray*)travelArray
{
    GoldData* t=[GoldData new];
    t.title=@"跟团游";
    GoldData* t1=[GoldData new];
    t1.title=@"自助游";
    GoldData* t2=[GoldData new];
    t2.title=@"本地玩乐";
    GoldData* t3=[GoldData new];
    t3.title=@"海外自由行";
    GoldData* t4=[GoldData new];
    t4.title=@"自驾游";
    GoldData* t5=[GoldData new];
    t5.title=@"旅游度假";
    GoldData* t6=[GoldData new];
    t6.title=@"周末游";
    GoldData* t7=[GoldData new];
    t7.title=@"旅游推荐";
    return @[t,t1,t2,t3,t4,t5,t6,t7];
    
}
+(NSArray*)othreArray
{
    GoldData* other=[GoldData new];
    other.title=@"电影票";
    GoldData* other1=[GoldData new];
    other1.title=@"打车";
    GoldData* other2=[GoldData new];
    other2.title=@"美食";
    return @[other,other1,other2];
}
+(NSArray*)allArray
{
    GoldData* y=[GoldData new];
    y.hotelTitle=@"酒店";
    y.imageStr=@"hotel";
    GoldData* y1=[GoldData new];
    y1.hotelTitle=@"美食";
    y1.imageStr=@"food";
    GoldData* y2=[GoldData new];
   y2.hotelTitle=@"机票";
    y2.imageStr=@"flane";
    GoldData* y3=[GoldData new];
    y3.hotelTitle=@"电影票";
    y3.imageStr=@"moive";
    GoldData* y4=[GoldData new];
    y4.imageStr=@"jq";
    y4.hotelTitle=@"景区";
    NSArray* hotelTitleArray=@[y,y1,y2,y3,y4];
    
    return hotelTitleArray;
    
}
@end

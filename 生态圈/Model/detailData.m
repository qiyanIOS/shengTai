//
//  detailData.m
//  fang
//
//  Created by apple on 16/3/3.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "detailData.h"

@implementation detailData
static NSArray*_modelData;
+(NSArray*)ModelData
{
    if (!_modelData) {
        _modelData=[[self alloc]getJSONModel:@"happyCell.plist" ];
    }
    return _modelData;
}
-(NSArray*)getJSONModel:(NSString*)modelData
{
    NSString* modelDataPath=[[NSBundle mainBundle]pathForResource:modelData ofType:nil];
    NSArray *dicArray =[NSArray arrayWithContentsOfFile:modelDataPath];
    
    NSMutableArray *mutableDataArray=[NSMutableArray array];
    for (NSDictionary* dic in dicArray) {
        ModelData* data=[ModelData new];
        [data setValuesForKeysWithDictionary:dic];
        [mutableDataArray addObject:data];
    }
    return [mutableDataArray copy];
    
}

@end

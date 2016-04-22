//
//  travelView.m
//  生态圈
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "travelView.h"

@implementation travelView

-(instancetype)init
{
    if (self=[super init]) {
        [self initView];
    }
    return self;
}
-(void)initView
{
    // 创建不带标题的图片轮播器
    NSArray *images = @[[UIImage imageNamed:@"travel.png"],[UIImage imageNamed:@"travel2.png"],[UIImage imageNamed:@"travel3.png"]];
    _cycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 130) imagesGroup:images];
    //_cycleScrollView.delegate = self;
    _cycleScrollView.autoScrollTimeInterval = 2.0;
    UIView* lineView=[[UIView alloc]initWithFrame:CGRectMake(0, _cycleScrollView.frame.size.height, [UIScreen mainScreen].bounds.size.width, 20)];
    lineView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 20)];
    label.textColor=[UIColor colorWithRed:212.0/255 green:75.0/255 blue:81.0/255 alpha:1];
    label.font=[UIFont systemFontOfSize:14];
    label.text=@"出行";
    
    
    [lineView addSubview:label];
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _cycleScrollView.frame.size.height+lineView.frame.size.height);
    
    [self addSubview:_cycleScrollView];
    [self addSubview:lineView];
    
}

@end

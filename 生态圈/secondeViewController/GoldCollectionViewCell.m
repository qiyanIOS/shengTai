//
//  GoldCollectionViewCell.m
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GoldCollectionViewCell.h"

@implementation GoldCollectionViewCell
-(UILabel*)label
{
    if (!_label) {
        _label=[[UILabel alloc]init];
        _label.textAlignment=NSTextAlignmentCenter;
        _label.textColor=[UIColor whiteColor];
        _label.font=[UIFont systemFontOfSize:15];
    }
    return _label;
}

-(void)setData:(GoldData *)data
{
    _data=data;
    
        self.label.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.layer.cornerRadius=5;
        self.label.text=data.title;
    self.backgroundColor=[UIColor colorWithRed:212.0/255 green:75.0/255 blue:81.0/255 alpha:1];
         [self.contentView addSubview:self.label];
  
   
   
}
-(void)setTravelData:(GoldData *)travelData
{

    
    self.label.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.label.text=travelData.title;
    self.backgroundColor=[UIColor colorWithRed:239.0/255 green:129.0/255 blue:19.0/255 alpha:1];
    self.layer.cornerRadius=5;
    [self.contentView addSubview:self.label];
}
-(void)setOtherData:(GoldData *)otherData
{
    self.label.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.label.text=otherData.title;
    self.backgroundColor=[UIColor colorWithRed:35.0/255 green:139.0/255 blue:82.0/255 alpha:1];
    self.layer.cornerRadius=5;
    [self.contentView addSubview:self.label];
}
@end

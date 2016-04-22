//
//  YHCollectionViewCell.m
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YHCollectionViewCell.h"

@implementation YHCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setData:(GoldData *)data
{
    _data=data;
    self.layer.cornerRadius=10;
    self.image.image=[UIImage imageNamed:data.imageStr];
    self.image.layer.cornerRadius=10;
    self.image.layer.masksToBounds=YES;
    self.titleLabel. backgroundColor=[UIColor colorWithRed:158.0/255 green:25.0/255 blue:27.0/255 alpha:0.3];
    self.titleLabel.text=data.hotelTitle;
}
@end

//
//  OneHappyTableViewCell.m
//  生态圈
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OneHappyTableViewCell.h"

@implementation OneHappyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setData:(ModelData *)data
{
    _data=data;
    _backView.backgroundColor=[UIColor colorWithWhite:0.0 alpha:0.5];
    _titleLabel.text=data.title;
    _cellImage.image=[UIImage imageNamed:data.titleimg];
}

@end

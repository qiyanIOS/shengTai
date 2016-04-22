//
//  BtnTableViewCell.m
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "BtnTableViewCell.h"

@implementation BtnTableViewCell
#define buttonW   [UIScreen mainScreen].bounds.size.width/3
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        [self getButton];
//      
//    }
//    return self;
//}
-(void)getButton:(NSArray*)data
{
    
    for (int i=0; i<data.count; i++) {
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(i*buttonW, 0, buttonW, buttonW-20);
        
        
        _data=data[i];
        
        
        [button setTitle:_data.title forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:13];
        CGSize titleSize=[button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}];
        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        button.backgroundColor=[UIColor whiteColor];
        button.imageEdgeInsets=UIEdgeInsetsMake(-40, 0, 0, -titleSize.width);
        
        
        
        [button setTitleEdgeInsets:UIEdgeInsetsMake(40,-26, 0, 0)];
        [button setImage:[UIImage imageNamed:_data.imageStr] forState:UIControlStateNormal];
        button.tag=i;
        [button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
        
    }
        //设置右边的竖线边框
        for (int i=1; i<=2; i++) {
            UILabel * tempLabel=[[UILabel alloc]initWithFrame:CGRectMake(buttonW*i+1, 0, 1, buttonW-20)];
            tempLabel.backgroundColor=[UIColor colorWithRed:235./255 green:235./255 blue:235./255 alpha:1];
            [self addSubview:tempLabel];
        }
        //设置下面的边框
    _hLabel=[[UILabel alloc]initWithFrame:CGRectMake(0,buttonW-20-1, [UIScreen mainScreen].bounds.size.width, 1)];
    _hLabel.backgroundColor=[UIColor colorWithRed:235./255 green:235./255 blue:235./255 alpha:1];
    [self addSubview:self.hLabel];
    
    
    
    
    
}

-(void)setCellArray:(NSArray *)cellArray
{
     [self getButton:cellArray];
}
-(UILabel*)hLabel
{
    if (!_hLabel) {
        _hLabel=[[UILabel alloc]init];
        
    }
    return _hLabel;
}
-(void)cellButtonClick:(UIButton*)btn
{
    if (self.btnClick) {
        self.btnClick(btn);
    }
}

@end

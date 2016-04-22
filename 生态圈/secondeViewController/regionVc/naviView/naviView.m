//
//  naviView.m
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "naviView.h"

@implementation naviView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
       self.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
        UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(10, 32, 22, 20);
        [btn setImage:[UIImage imageNamed:@"cancelBtn"] forState:0];
        [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        UILabel* label=[[UILabel alloc]init];
        label.center=CGPointMake(frame.size.width/2, frame.size.height/2+10);
        label.bounds=CGRectMake(0, 0, 100, 30);
        label.text=@"城市选择";
        label.textAlignment=NSTextAlignmentCenter;
        [self addSubview:label];
        UIView* lineView=[[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        lineView.backgroundColor= [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        [self addSubview:lineView];
    }
    return self;
}
-(void)click
{
    if ([_delegate respondsToSelector:@selector(backBtnDidClick)]) {
        [_delegate backBtnDidClick];
    }
}
@end

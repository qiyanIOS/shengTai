//
//  LearnHeadView.m
//  生态圈
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LearnHeadView.h"

@implementation LearnHeadView
#define leftAndRight  30
#define mid  40
#define top 10
#define ButtonW  ([UIScreen mainScreen].bounds.size.width-3*mid-2*leftAndRight)/4
-(instancetype)init
{
    if (self=[super init]) {
        [self getView];
    }
    return self;
}
-(void)getView
{
    NSArray* array=@[@"师",@"校",@"辅",@"讯"];
    NSArray* titleArray=@[@"名师推荐",@"名校推荐",@"辅导资料",@"资讯"];
    for (int i=0; i<4; i++) {
        
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(leftAndRight+i*(ButtonW+mid), top, ButtonW, ButtonW);
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(headBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        
        button.titleLabel.font=[UIFont systemFontOfSize:20];
        button.backgroundColor=[UIColor lightGrayColor];
        button.layer.cornerRadius=ButtonW/2;
        button.layer.masksToBounds=YES;
        if(i==0||i==3)
        {
            button.backgroundColor=[UIColor colorWithRed:244/255.0 green:188/255.0 blue:36/255.0 alpha:1];
        }if (i==1||i==2) {
             button.backgroundColor=[UIColor colorWithRed:53/255.0 green:169/255.0 blue:155/255.0 alpha:1];

        }
        
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(leftAndRight-10+i*(ButtonW+mid), ButtonW+top+5, ButtonW+20, 20)];
        
        label.text=titleArray[i];
        label.textColor=[UIColor darkGrayColor];
        label.font=[UIFont systemFontOfSize:14];
        label.textAlignment=NSTextAlignmentCenter;
        
       
        [self addSubview:label];
        
        
//        
//        UILabel* photoLabel=[[UILabel alloc]init];
//        photoLabel.frame=CGRectMake(button.frame.origin.x+ButtonW/2-20, 0, 40, 40);
//        photoLabel.backgroundColor=[UIColor redColor];
//        photoLabel.layer.cornerRadius=20;
//        photoLabel.layer.masksToBounds=YES;
//        
//        [self addSubview:photoLabel];
        
        [self addSubview:button];
        
    }
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, ButtonW+top+20+5+10);
}
-(void)headBtnClick:(UIButton*)btn
{
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"headBtnClick" object:nil userInfo:@{@"headBtnClick":btn}];
}
@end

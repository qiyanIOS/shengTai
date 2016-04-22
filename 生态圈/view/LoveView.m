//
//  LoveView.m
//  生态圈
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoveView.h"
#define Swidth [UIScreen mainScreen].bounds.size.width
#define labelHeight 20
#define imageheight 200
#define buttonW   (Swidth-3)/4
#define newButton  Swidth/4
@implementation LoveView
-(id)initWith:(NSInteger)index
{
    if (self=[super init]) {
        [self getViewWith:index];
    }
    return self;
}
-(void)getViewWith:(NSInteger)index
{
    if (index==1) {
        NSString*string = @"已有1212352人加入爱心公益";
        NSRange range = [string rangeOfString: @"1212352"];
        NSMutableAttributedString*attribute = [[NSMutableAttributedString alloc] initWithString: string];
        [attribute addAttributes: @{NSForegroundColorAttributeName: [UIColor orangeColor]}range: range];
        
        UILabel* numLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, Swidth, labelHeight)];
        numLabel.font=[UIFont systemFontOfSize:15];
        numLabel.textAlignment=NSTextAlignmentCenter;
        numLabel.backgroundColor=[UIColor whiteColor];
        [numLabel setText: string];
        [numLabel setAttributedText: attribute];
        
        NSArray *images = @[[UIImage imageNamed:@"img.png"],[UIImage imageNamed:@"img1.png"],[UIImage imageNamed:@"img2.png"]];
        NSArray* titleArray=@[@"病残儿童申请到补助或辅助设备",@"专题 在每个项目村设立儿童福利主任",@"关爱空巢老人"];
        [self getArray:images andStr:labelHeight andWidth:imageheight andStrArray:titleArray andIndex:index];
         self.backgroundColor=[UIColor colorWithRed:235./255 green:235./255 blue:235./255 alpha:1];
        self.frame=CGRectMake(0, 0, Swidth, labelHeight+imageheight+buttonW+10);
        [self addSubview:numLabel];
    }if (index==2) {
   
    
        NSArray *images = @[[UIImage imageNamed:@"j1.png"],[UIImage imageNamed:@"j2.png"],[UIImage imageNamed:@"j3.png"]];
        NSArray* titleArray=@[@"互联宝“马拉松活动”圆满完成",@"七夕相亲大会",@"圈子好友组织郊游"];
        [self getArray:images andStr:0 andWidth:imageheight andStrArray:titleArray andIndex:index];
        self.frame=CGRectMake(0, 0, Swidth, imageheight+newButton+10);
    }if (index==3) {
         NSArray *images = @[[UIImage imageNamed:@"j1.png"],[UIImage imageNamed:@"j2.png"],[UIImage imageNamed:@"j3.png"]];
        [self getArray:images andStr:0 andWidth:imageheight andStrArray:nil andIndex:index];
        self.frame=CGRectMake(0, 0, Swidth, imageheight+newButton+10);
        
    }
   

    
    
    
   
    
    
    
    
}
-(void)getArray:(NSArray*)array andStr:(NSInteger)height andWidth:(NSInteger)Width andStrArray:(NSArray*)strArray andIndex:(NSInteger)index
{
    
    _cycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, height, Swidth, Width) imagesGroup:array];
    _cycleScrollView.titlesGroup=strArray;
    _cycleScrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    //_cycleScrollView.delegate = self;
    _cycleScrollView.autoScrollTimeInterval = 4.0;
    [self addSubview:_cycleScrollView];
    
    NSArray* btnarray=@[@"发起募捐",@"互捐互助",@"爱心基金",@"爱心排行"];
    NSArray* interBtn=@[@"交友",@"活动",@"圈子",@"话题"];
    NSArray* happyBtn=@[@"兴趣部落",@"线上活动",@"欢乐百科",@"小喵推荐"];
    for (int i=0; i<btnarray.count; i++) {
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        if (index==1) {
            button.frame=CGRectMake(i*(buttonW+1), height+Width, buttonW, buttonW+10);
            [button setTitle:btnarray[i] forState:UIControlStateNormal];
             [button setImage:[UIImage imageNamed:@"gy"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];

        }if (index==2)
        {
            button.frame=CGRectMake(i*(newButton), height+Width, newButton, newButton+10);
            [button setTitle:interBtn[i] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t%d",i]] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }if (index==3) {
            button.frame=CGRectMake(i*(newButton), height+Width, newButton, newButton+10);
            [button setTitle:happyBtn[i] forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"t%d",i]] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        }
        
        
        
       
        
        button.titleLabel.font=[UIFont systemFontOfSize:14];
        button.backgroundColor=[UIColor whiteColor];
        
        CGSize titleSize=[button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        button.imageEdgeInsets=UIEdgeInsetsMake(-30, 0, 0, -titleSize.width);
        button.titleEdgeInsets=UIEdgeInsetsMake(60, -button.imageView.frame.size.width, 0, 0);
        
        
        [self addSubview:button];
    }
    


}

@end

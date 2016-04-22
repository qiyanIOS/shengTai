//
//  shenHuoView.m
//  生态圈
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "shenHuoView.h"

@implementation shenHuoView

#define top 10
#define rightAndLeft 30
#define Middle  20
#define MiddleAndY  10
#define buttonWidth ([UIScreen mainScreen].bounds.size.width-120)/4

#define  K_MAIN_VIEW_SCROLL_HEIGHT 20.0f

#define K_MAIN_VIEW_TEME_INTERVAL 1        //计时器间隔时间(单位秒)
#define K_MAIN_VIEW_SCROLLER_SPACE 40        //每次移动的距离
#define K_MAIN_VIEW_SCROLLER_LABLE_WIDTH  280  //字体宽度
#define K_MAIN_VIEW_SCROLLER_LABLE_MARGIN 20   //前后间隔距离
-(instancetype)init
{
    if (self=[super init]) {
        [self initView];
    }
    return self;
}
-(void)initView
{
    if (!self.arrData) {
        self.arrData = @[
                         
                             @"三大理由欧元任性抗跌，欧元区峰会将为希腊定调"
                             
                        ,@"欧盟峰会或现希腊转机，黄金打响1162保卫战"
                             
                        ,@"希腊困局欧元不怕，油价服软暴跌8%"
                             
                         ];
    }
    //文字滚动
    [self initScrollText];
    
    //开启滚动
    [self startScroll];
    
    NSArray* titleArray=@[@"缴费",@"配送",@"物业",@"便利店",@"外卖",@"家政",@"丽人",@"更多"];
    for (int i=0; i<titleArray.count; i++) {
        UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(rightAndLeft+i%4*(buttonWidth+Middle), top+K_MAIN_VIEW_SCROLL_HEIGHT+i/4*(buttonWidth+MiddleAndY), buttonWidth, buttonWidth);
        button.backgroundColor=[UIColor grayColor];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.layer.cornerRadius=buttonWidth/2;
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        switch (i) {
            case 0:
                button.backgroundColor=[UIColor colorWithRed:113.0/255 green:131.0/255 blue:44.0/255 alpha:1];
                break;
            case 1:
                button.backgroundColor=[UIColor colorWithRed:234.0/255 green:79.0/255 blue:84.0/255 alpha:1];
                break;
            case 2:
                button.backgroundColor=[UIColor colorWithRed:102.0/255 green:113.0/255 blue:182.0/255 alpha:1];
                break;
            case 3:
                button.backgroundColor=[UIColor colorWithRed:226.0/255 green:191.0/255 blue:50.0/255 alpha:1];
                break;
            case 4:
                button.backgroundColor=[UIColor colorWithRed:134.0/255 green:36.0/255 blue:100.0/255 alpha:1];

                break;
            case 5:
                button.backgroundColor=[UIColor colorWithRed:56.0/255 green:180.0/255 blue:207.0/255 alpha:1];
                break;
            case 6:
                button.backgroundColor=[UIColor colorWithRed:46.0/255 green:174.0/255 blue:166.0/255 alpha:1];
                break;
            case 7:
                button.backgroundColor=[UIColor colorWithRed:207.0/255 green:103.0/255 blue:154.0/255 alpha:1];
                break;
                
                
            default:
                break;
        }
        
        [self addSubview:button];
    }
    UIView* ligtView=[[UIView alloc]initWithFrame:CGRectMake(0, K_MAIN_VIEW_SCROLL_HEIGHT+2*buttonWidth+MiddleAndY+2*top, [UIScreen mainScreen].bounds.size.width, 30)];
    ligtView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 30)];
    //label.textColor=[UIColor lightGrayColor];
    //label.textColor=[UIColor colorWithRed:100/255.0  green:171/255.0  blue:31/255.0 alpha:1];
     label.textColor=[UIColor colorWithRed:251/255.0  green:107/255.0  blue:24/255.0 alpha:1];
    label.font=[UIFont systemFontOfSize:14];
    label.backgroundColor=[UIColor clearColor];
    label.text=@"便民工具"; 
    [ligtView addSubview:label];
    
    [self addSubview:ligtView];
    self.backgroundColor=[UIColor whiteColor];
    self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 2*buttonWidth+MiddleAndY+2*top+30+K_MAIN_VIEW_SCROLL_HEIGHT);
    //NSLog(@"%lf",2*buttonWidth+MiddleAndY+2*top+30+60);
    
}

//文字滚动初始化
-(void) initScrollText{
    
    //获取滚动条
    
    if(!self.scrollViewText){
        self.scrollViewText = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, K_MAIN_VIEW_SCROLL_HEIGHT)];
        self.scrollViewText.showsHorizontalScrollIndicator = NO;   //隐藏水平滚动条
        self.scrollViewText.showsVerticalScrollIndicator = NO;     //隐藏垂直滚动条
      // self.scrollViewText.tag = K_MAIN_VIEW_SCROLL_TEXT_TAG;
        [self.scrollViewText setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        
        //清除子控件
        for (UIView *view in [self.scrollViewText subviews]) {
            [view removeFromSuperview];
        }
        
        //添加到当前视图
        [self addSubview:self.scrollViewText];
    }
    
    
    if (self.arrData) {
        
        CGFloat offsetX = 0 ,  h = 10;
        
        //设置滚动文字
        UILabel *labText = nil;
        for (int i=0; i<self.arrData.count;i++) {
            labText = [[UILabel alloc] initWithFrame:CGRectMake(i *(K_MAIN_VIEW_SCROLLER_LABLE_WIDTH + K_MAIN_VIEW_SCROLLER_LABLE_MARGIN),(K_MAIN_VIEW_SCROLL_HEIGHT-h ) / 2,
                                                                K_MAIN_VIEW_SCROLLER_LABLE_WIDTH,
                                                                h)];
            [labText setFont:[UIFont systemFontOfSize:14]];
            [labText setTextColor:[UIColor blackColor]];
            labText.text = self.arrData[i];
            offsetX += labText.frame.origin.x;
            
            //添加到滚动视图
            [self.scrollViewText addSubview:labText];
            
        
        }
        
        //设置滚动区域大小
        [self.scrollViewText setContentSize:CGSizeMake(offsetX, 0)];
    }
}


//开始滚动
-(void) startScroll{
    
    if (!self.timer)
        self.timer = [NSTimer scheduledTimerWithTimeInterval:K_MAIN_VIEW_TEME_INTERVAL target:self selector:@selector(setScrollText) userInfo:nil repeats:YES];
    
    [self.timer fire];
}


//滚动处理
-(void) setScrollText{
    
    CGFloat startX = self.scrollViewText.contentSize.width - K_MAIN_VIEW_SCROLLER_LABLE_WIDTH - K_MAIN_VIEW_SCROLLER_LABLE_MARGIN;
    
    [UIView animateWithDuration:K_MAIN_VIEW_TEME_INTERVAL * 2 animations:^{
        CGRect rect;
        CGFloat offsetX = 0.0;
        
        for (UILabel *lab in self.scrollViewText.subviews) {
            
            rect = lab.frame;
            offsetX = rect.origin.x - K_MAIN_VIEW_SCROLLER_SPACE;
          if (offsetX < -K_MAIN_VIEW_SCROLLER_LABLE_WIDTH)
              
              offsetX=startX;
           
          
            
            lab.frame = CGRectMake(offsetX, rect.origin.y, rect.size.width, rect.size.height);
        }
        
        
    }];
    
}

@end

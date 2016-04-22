//
//  SC-HomeHeardView.m
//  房博村2
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "SC-HomeHeardView.h"
#import "SDCycleScrollView.h"
#import "titleModel.h"

@interface SC_HomeHeardView()<SDCycleScrollViewDelegate>
@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;
@property(nonatomic,strong)NSArray* titleArray;
@property(nonatomic,strong)NSArray* chuanTitleArray;

@end
@implementation SC_HomeHeardView

#define buttonWidth ([UIScreen mainScreen].bounds.size.width-140)/4

#define rightAndLeft 10
#define Middle  40
#define MiddleAndY  30
#define  ScrollViewHeight 120
#define buttonY   ScrollViewHeight+10
#define SecondMiddleY  30
#define  SecondMiddle 40
#define SecondbuttonWidth ([UIScreen mainScreen].bounds.size.width-160)/4
#define secondRightAndLeft 20
-(NSArray*)titleArray
{
    if (!_titleArray) {
        _titleArray=[titleModel titleArray][0];
    }
    return _titleArray;
}
-(NSArray*)chuanTitleArray
{
    if (!_chuanTitleArray) {
        NSArray* array=[titleModel titleArray];
        
        _chuanTitleArray=array[1];
    }
    return _chuanTitleArray;
}
-(id)initWithIndex:(NSInteger)index
{
    if (self=[super init]) {
        [self initButton:index];
    }
    return self;
}

-(void)initButton:(NSInteger)index
{

    if (index==1) {
        [self getView:self.titleArray andIndex:index];
    
    }if (index==2) {
            NSArray *images = @[[UIImage imageNamed:@"u1.png"],[UIImage imageNamed:@"u2.png"]];
        
            CGFloat w = [UIScreen mainScreen].bounds.size.width;
        
            // 创建不带标题的图片轮播器
            _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, w, ScrollViewHeight) imagesGroup:images];
            _cycleScrollView.delegate = self;
            _cycleScrollView.autoScrollTimeInterval = 2.0;
            [self addSubview:_cycleScrollView];
        [self getView:self.chuanTitleArray andIndex:index];

    }
}
-(void)getView:(NSArray*)array andIndex:(NSInteger)index
{
    for (int i=0; i<array.count; i++) {
        _button=[UIButton buttonWithType:UIButtonTypeCustom];
        UILabel*label=[[UILabel alloc]init];
        
        if (index==1) {
            _button.frame=CGRectMake(rightAndLeft+i%4*(buttonWidth+Middle), 10+i/4*(buttonWidth+MiddleAndY), buttonWidth, buttonWidth);
            [_button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"icon%d",i]] forState:UIControlStateNormal];
             [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            _button.layer.cornerRadius=buttonWidth/2;
            label.frame=CGRectMake(rightAndLeft+i%4*(buttonWidth+Middle),10+buttonWidth+5+i/4*(buttonWidth+MiddleAndY), buttonWidth, 20)
            ;
//            if (i<=3) {
//                label.textColor=[UIColor colorWithRed:99.0/255 green:154.0/255 blue:43.0/255 alpha:1];
//                
//            }else if (i>3&&i<=7) {
//                label.textColor=[UIColor colorWithRed:225.0/255 green:126.0/255 blue:0.0 alpha:1];
//            }else
//            {
//                label.textColor=[UIColor colorWithRed:133.0/255 green:75.0/255 blue:144.0/255 alpha:1];
//            }
            label.font=[UIFont systemFontOfSize:13];
            

        }else if(index==2)
        {
           
            _button.frame=CGRectMake(secondRightAndLeft+i%4*(SecondbuttonWidth+SecondMiddle), buttonY+i/4*(SecondbuttonWidth+SecondMiddleY), SecondbuttonWidth, SecondbuttonWidth);
            _button.backgroundColor=[UIColor lightGrayColor];
                 _button.layer.cornerRadius=SecondbuttonWidth/2;
            [_button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"top%d",i]] forState:UIControlStateNormal];
            _button.imageView.contentMode=UIViewContentModeScaleAspectFill;
            label.frame=CGRectMake(secondRightAndLeft-5+i%4*(SecondbuttonWidth+SecondMiddle), buttonY+SecondbuttonWidth+10+i/4*(SecondbuttonWidth+SecondMiddleY), buttonWidth,10);
            label.font=[UIFont systemFontOfSize:13];
            
           
        }
        
        
        
   
        
        _button.tag=i;
       
        
        [self addSubview:_button];
        
       
               titleModel* model=array[i];
        label.text=model.title;
        label.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:label];
        
        
        
    }
    if (index==1) {
        
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 3*buttonWidth+2*MiddleAndY+10+3*rightAndLeft);
    }else if(index==2)
    {
        UIView* lingView=[[UIView alloc]initWithFrame:CGRectMake(0, ScrollViewHeight+2*SecondbuttonWidth+2*SecondMiddleY+10, [UIScreen mainScreen].bounds.size.width, 30)];
        lingView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 30)];
        label.text=@"最新筹资项目";
        label.backgroundColor=[UIColor clearColor];
        label.font=[UIFont systemFontOfSize:15];
        label.textColor=[UIColor colorWithRed:201/255.0  green:0/255.0  blue:22/255.0 alpha:1];
        [lingView addSubview:label];
        [self addSubview:lingView];
        self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,ScrollViewHeight+2*SecondbuttonWidth+2*SecondMiddleY+30+10);
    }
    
    self.backgroundColor=[UIColor whiteColor];
    

}
-(void)buttonClick:(UIButton*)button
{
    [[NSNotificationCenter defaultCenter ]postNotificationName:@"buttonClick" object:nil userInfo:@{@"buttonClick":@(button.tag)}];
}
#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"你点了第%ld张",(long)index);
    [[NSNotificationCenter defaultCenter]postNotificationName:@"adviertiseMent" object:self userInfo:@{@"adviertiseMent":@(index)}];
    
}
@end

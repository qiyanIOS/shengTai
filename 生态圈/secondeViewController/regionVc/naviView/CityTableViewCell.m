//
//  CityTableViewCell.m
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CityTableViewCell.h"

@implementation CityTableViewCell
#define MIDWIDTH  20
#define BTNWIDTH  ([UIScreen mainScreen].bounds.size.width-4*MIDWIDTH)/3
#define MIDHEIGHT 10
#define BTNHEIGHT 35
#define  ScreenWidth [UIScreen mainScreen].bounds.size.width
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cityArray:(NSArray *)cityArray
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
            
            
            _cityArray=cityArray;
            self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0  blue:245/255.0  alpha:1];
            
            for (int i=0; i<cityArray.count; i++) {
                UIButton* btn=[UIButton buttonWithType:UIButtonTypeCustom];
                //btn.frame=CGRectMake(MIDWIDTH+(i%3)*(BTNWIDTH+MIDWIDTH), MIDHEIGHT+(i/4)*(BTNHEIGHT+MIDHEIGHT),BTNWIDTH , BTNHEIGHT);
                btn.center = CGPointMake(ScreenWidth/6+(ScreenWidth/3-10)*(i%3), 30+(30+15)*(i/3));
                btn.tag = i;
                btn.bounds = CGRectMake(0, 0, ScreenWidth/3-30, 35);
                
               
                [btn setTitleColor:[UIColor colorWithRed:54/255.0 green:54/255.0 blue:54/255.0 alpha:1] forState:0];
                [btn setTitle:cityArray[i] forState:0];
                [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
                [btn setBackgroundColor:[UIColor whiteColor]];
                [self addSubview:btn];
                btn.layer.borderWidth = 0.5;
                btn.layer.borderColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1].CGColor;
        }
        //self.frame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, MIDHEIGHT+)
    }
    return self;
}
-(void)click:(UIButton*)button
{
//    if (_cityArray.count==1&&button.tag==0) {
//        _ClickBtnBlock(111);
//    }else if(_cityArray.count==2)
//    {
//        _ClickBtnBlock(1);
//    }else
//    {
//        _ClickBtnBlock(button.tag);
//    }
    _ClickBtnBlock(button.tag);
    
}
@end

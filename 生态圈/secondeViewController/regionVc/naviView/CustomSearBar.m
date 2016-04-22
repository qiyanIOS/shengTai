//
//  CustomSearBar.m
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "CustomSearBar.h"

@implementation CustomSearBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.backgroundColor=[UIColor lightGrayColor];
        _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(10, 7, frame.size.width-20, 30)];
        _searchBar.placeholder=@"输入城市名/拼音查找";
        _searchBar.backgroundImage = [self imageWithColor:[UIColor clearColor] size:_searchBar.bounds.size];
        _searchBar.barStyle = UIBarMetricsDefault;
        // searchBar.tintColor = [UIColor blueColor];// 搜索框的颜色，当设置此属性时，barStyle将失效
        [_searchBar setTranslucent:YES];// 设置是否透明
        _searchBar.delegate=self;
        [self addSubview:_searchBar];
    }
    return self;
}
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
    for (id cancelBtn in searchBar.subviews) {
        if ([cancelBtn isKindOfClass:[UIButton class]]) {
            UIButton* btn=(UIButton*)cancelBtn;
            [btn setTitle:@"取消" forState:UIControlStateNormal];
        }
    }
    if (searchBar.text.length==0||[searchBar.text isEqualToString:@""]||[searchBar.text isKindOfClass:[NSNull class]]  ) {
        if ([_delegate respondsToSelector:@selector(didBeginEiding)]) {
            [_delegate didBeginEiding];
        }
    }else
    {
        if ([_delegate respondsToSelector:@selector(didSearchString:)]) {
            [_delegate didSearchString:searchBar.text];
        }
    }
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    if ([_delegate respondsToSelector:@selector(didSelectedCancleBtn)]) {
        [_delegate didSelectedCancleBtn];
    }
}
//取消searchbar背景色
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

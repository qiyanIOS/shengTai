//
//  EndesBtn.m
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "EndesBtn.h"

@implementation EndesBtn
+(id)btnWithImage:(NSString *)image andTitle:(NSString *)title andBtn:(UIButton *)button
{
    
  
    
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    
    CGSize titleSize=[button.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
   button.titleEdgeInsets=UIEdgeInsetsMake(35, -button.imageView.bounds.size.width, 0, 0);
    
   button.imageEdgeInsets=UIEdgeInsetsMake(-30, 0, 0, -titleSize.width);
    
    return button;

}


@end

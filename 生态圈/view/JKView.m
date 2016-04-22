//
//  JKView.m
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "JKView.h"

@implementation JKView
+(id)JKWithView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"JKView" owner:nil options:nil]lastObject];
     
    
}


@end

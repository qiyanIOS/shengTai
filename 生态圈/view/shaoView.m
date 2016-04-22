//
//  shaoView.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "shaoView.h"

@implementation shaoView

+(id)saoView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"shaoView" owner:nil options:nil] lastObject];
}

@end

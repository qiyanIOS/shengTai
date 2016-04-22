//
//  didanView.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "didanView.h"

@implementation didanView

+(id)dingDanView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"didan" owner:nil options:nil]lastObject];
}

@end

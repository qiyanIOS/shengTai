//
//  regionView.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "regionView.h"

@implementation regionView

+(id)regionVIew
{
  return   [[[NSBundle mainBundle] loadNibNamed:@"regionView" owner:nil options:nil] lastObject];

}

@end

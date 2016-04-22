//
//  GCView.m
//  生态圈
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GCView.h"

@implementation GCView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(id)view
{
    
  
    return [[[NSBundle mainBundle] loadNibNamed:@"GCView" owner:nil options:nil]lastObject];
}

- (IBAction)btn:(UIButton*)sender {
    NSLog(@"%ld",(long)sender.tag);
}

@end

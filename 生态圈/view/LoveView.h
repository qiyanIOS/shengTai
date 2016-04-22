//
//  LoveView.h
//  生态圈
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
@interface LoveView : UIView
@property(nonatomic,strong)SDCycleScrollView* cycleScrollView;
-(id)initWith:(NSInteger)index;
@end

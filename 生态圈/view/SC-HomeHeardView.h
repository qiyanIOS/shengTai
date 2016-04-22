//
//  SC-HomeHeardView.h
//  房博村2
//
//  Created by apple on 15/12/16.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^heardButtonTag) (NSInteger);
@interface SC_HomeHeardView : UIView

@property(nonatomic,strong)UIButton* button;
@property(nonatomic,copy)heardButtonTag tagBlock;
-(id)initWithIndex:(NSInteger)index;
@end

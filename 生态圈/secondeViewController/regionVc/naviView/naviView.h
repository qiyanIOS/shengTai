//
//  naviView.h
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol naviViewDelegate<NSObject>
-(void)backBtnDidClick;
@end
@interface naviView : UIView
@property(nonatomic,assign)id<naviViewDelegate>delegate;
@end

//
//  JKView.h
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKView : UIView
@property (weak, nonatomic) IBOutlet UIButton *saoBtn;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;
@property (weak, nonatomic) IBOutlet UIButton *DHBtn;
@property (weak, nonatomic) IBOutlet UIButton *CZBtn;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *backView;
+(id)JKWithView;
@end

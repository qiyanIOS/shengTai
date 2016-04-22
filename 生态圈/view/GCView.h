//
//  GCView.h
//  生态圈
//
//  Created by apple on 16/3/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCView : UIView
@property (weak, nonatomic) IBOutlet GCView *scrollImageView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btnArray;
+(id)view;
@end

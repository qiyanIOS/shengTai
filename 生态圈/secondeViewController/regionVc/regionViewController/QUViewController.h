//
//  QUViewController.h
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QUViewController : UIViewController
@property(nonatomic,copy)void(^selectedStr)(NSString* string);
@end

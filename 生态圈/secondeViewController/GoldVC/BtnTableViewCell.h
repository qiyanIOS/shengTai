//
//  BtnTableViewCell.h
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "payTitle.h"
@interface BtnTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel* hLabel;
@property(nonatomic,strong)UILabel*vLabel;
@property(nonatomic,strong)UIButton* cellBtn;
@property(nonatomic,strong)payTitle* data;
@property(nonatomic,strong)NSArray* cellArray;
@property(nonatomic,strong)void(^btnClick)(UIButton*);


@end

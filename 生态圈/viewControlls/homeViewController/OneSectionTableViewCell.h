//
//  OneSectionTableViewCell.h
//  生态圈
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OneSectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *huorLabel;
@property (weak, nonatomic) IBOutlet UILabel *minturesLabel;
@property (weak, nonatomic) IBOutlet UILabel *miaoLabel;

@property (nonatomic,assign)NSInteger timestamp;
@property(nonatomic,strong)NSTimer* timer;
@end

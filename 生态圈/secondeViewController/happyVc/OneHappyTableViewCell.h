//
//  OneHappyTableViewCell.h
//  生态圈
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelData.h"
@interface OneHappyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property(nonatomic,strong)ModelData* data;
@end

//
//  CityTableViewCell.h
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityTableViewCell : UITableViewCell
@property(nonatomic,strong)NSArray*cityArray;
@property(nonatomic,copy)void(^ClickBtnBlock)(NSInteger tag);
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cityArray:(NSArray*)cityArray;

@end

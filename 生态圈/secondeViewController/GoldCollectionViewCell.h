//
//  GoldCollectionViewCell.h
//  生态圈
//
//  Created by apple on 16/3/25.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoldData.h"
@interface GoldCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)GoldData* data;
@property(nonatomic,strong)UILabel* label;
@property(nonatomic,strong)GoldData* travelData;
@property(nonatomic,strong)GoldData* otherData;

@end

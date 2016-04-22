//
//  ToolCollectionViewCell.h
//  生态圈
//
//  Created by apple on 16/3/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *toolImage;
@property (weak, nonatomic) IBOutlet UILabel *bigTitle;
@property (weak, nonatomic) IBOutlet UILabel *smallTitle;

@end

//
//  twoLearnTableViewCell.m
//  生态圈
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "twoLearnTableViewCell.h"

@implementation twoLearnTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)Btnclick:(UIButton *)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"twoCellBtnClick" object:nil userInfo:@{@"twoCellBtnClick":@(sender.tag)}];
    
}

@end

//
//  oneTableViewCell.m
//  生态圈
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "oneTableViewCell.h"

@implementation oneTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)cellBtn:(UIButton*)sender {
    NSLog(@"%ld",(long)sender.tag);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"cellBtnClick" object:nil userInfo:@{@"cellBtnClick":@(sender.tag)}];
    
}

@end

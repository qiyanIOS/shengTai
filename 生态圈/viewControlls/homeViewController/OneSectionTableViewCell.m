//
//  OneSectionTableViewCell.m
//  生态圈
//
//  Created by apple on 16/3/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "OneSectionTableViewCell.h"

@implementation OneSectionTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 拿到外界传来的时间戳
- (void)setTimestamp:(NSInteger)timestamp{
    _timestamp = timestamp;
    if (_timestamp != 0) {
        _timer =[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
    }
}
-(void)timer:(NSTimer*)timerr{
    _timestamp--;
    [self getDetailTimeWithTimestamp:_timestamp];
    if (_timestamp == 0) {
        [_timer invalidate];
        _timer = nil;
        // 执行block回调
        //self.timerStopBlock();
    }
}
- (void)getDetailTimeWithTimestamp:(NSInteger)timestamp{
    NSInteger ms = timestamp;
    NSInteger ss = 1;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    
    
    // 剩余的
    
    NSInteger hour = ms / hh;// 时
   NSInteger minute  = (ms - hour * hh) / mi;// 分
   NSInteger second= (ms - hour * hh - minute * mi) / ss;// 秒
    //NSLog(@"%zd时:%zd分:%zd秒",hour,minute,second);
    
    self.huorLabel.text=[@(hour) stringValue];
    self.minturesLabel.text=[@(minute) stringValue];
    self.miaoLabel.text=[NSString stringWithFormat:@"%ld",second];
    
}

@end

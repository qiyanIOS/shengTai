//
//  oneLearnTableViewCell.m
//  生态圈
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "oneLearnTableViewCell.h"
@implementation oneLearnTableViewCell
#define leftAndRight  30
#define mid  30
#define top 10
#define ButtonW  ([UIScreen mainScreen].bounds.size.width-3*mid-2*leftAndRight)/4
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self getCellView];
    }
    return self;
}
-(void)getCellView
{
    NSArray*array=@[@"学前",@"小学",@"初中",@"高中",@"大学",@"培训",@"留学",@"艺术"];
    for (int i=0; i<8; i++) {
   
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(leftAndRight+i%4*(ButtonW+mid), top+i/4*(ButtonW+10), ButtonW, ButtonW);
        button.backgroundColor=[UIColor lightGrayColor];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.titleLabel.font=[UIFont systemFontOfSize:15];
        
        [button addTarget:self action:@selector(oneCellBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag=i;
        
        button.layer.cornerRadius=ButtonW/2;
        
        button.layer.masksToBounds=YES;
        
        switch (i) {
            case 0:
                button.backgroundColor=[UIColor colorWithRed:238/255.0 green:128/255.0 blue:69/255.0 alpha:1];
                break;
            case 1:
                button.backgroundColor=[UIColor colorWithRed:226/255.0 green:182/255.0 blue:46/255.0 alpha:1];
                break;
            case 2:
                button.backgroundColor=[UIColor colorWithRed:141/255.0 green:207/255.0 blue:94/255.0 alpha:1];
                break;
            case 3:
                button.backgroundColor=[UIColor colorWithRed:55/255.0 green:170/255.0 blue:157/255.0 alpha:1];
                break;
            case 4:
                button.backgroundColor=[UIColor colorWithRed:225/255.0 green:69/255.0 blue:74/255.0 alpha:1];
                break;
            case 5:
                button.backgroundColor=[UIColor colorWithRed:67/255.0 green:175/255.0 blue:214/255.0 alpha:1];
                break;
            case 6:
                button.backgroundColor=[UIColor colorWithRed:19/255.0 green:148/255.0 blue:111/255.0 alpha:1];
                break;
            case 7:
                button.backgroundColor=[UIColor colorWithRed:109/255.0 green:113/255.0 blue:179/255.0 alpha:1];
                break;
            default:
                break;
        }
        
        [self.contentView addSubview:button];
    
        
    }
    UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, top+10+2*ButtonW+10, [UIScreen mainScreen].bounds.size.width, 150)];
    imageView.image=[UIImage imageNamed:@"learn"];
    [self addSubview:imageView];
    
    
    self.bounds=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, top+10+2*ButtonW+10+150);
    
}
-(void)oneCellBtnClick:(UIButton*)btn
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"oneCellBtnClick" object:nil userInfo:@{@"oneCellBtnClick":btn}];
}
@end

//
//  ChatViewController.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()

@end

@implementation ChatViewController
-(instancetype)init
{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"chat" ];
        
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"chatSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.title=@"圈子";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"圈子";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

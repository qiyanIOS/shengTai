//
//  MyViewController.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController
-(instancetype)init
{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"my" ];
        
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"mySelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.title=@"我的";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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

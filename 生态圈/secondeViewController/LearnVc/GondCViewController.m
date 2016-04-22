//
//  GondCViewController.m
//  生态圈
//
//  Created by apple on 16/4/2.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GondCViewController.h"
#import "GCView.h"
#import "SDCycleScrollView.h"
#import "GongCTableViewCell.h"
@interface GondCViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@end

@implementation GondCViewController
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTableView];
}
-(void)getTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"GongCTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        GCView* headView=[GCView view];
        self.tableView.tableHeaderView=headView;
   
    // 创建不带标题的图片轮播器
    NSArray *images = @[[UIImage imageNamed:@"one1.png"],[UIImage imageNamed:@"one2.png"],[UIImage imageNamed:@"one3.png"]];
    
    
   
   
    SDCycleScrollView*cycleScrollView= [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width-130, headView.scrollImageView.frame.size.height) imagesGroup:images];
   
    
    
    //_cycleScrollView.delegate = self;
    cycleScrollView.autoScrollTimeInterval = 2.0;
    [headView.scrollImageView addSubview:cycleScrollView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor=[UIColor clearColor];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 30)];
    label.font=[UIFont systemFontOfSize:15];
    label.textColor=[UIColor lightGrayColor];
    [view addSubview:label];
    if(section==0)
    {
        label.text=@"猜你喜欢";
    }else
    {
        label.text=@"晒货、交流";
    }
    return view;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:245/255.0 green:68/255.0 blue:24/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}


@end

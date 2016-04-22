//
//  InterViewController.m
//  生态圈
//
//  Created by apple on 16/3/30.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "InterViewController.h"
#import "LoveView.h"
#import "oneTableViewCell.h"
#import "twoTableViewCell.h"
#import "CYDetailViewController.h"
@interface InterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;

@end

@implementation InterViewController
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
      [self getNotifi];
    [self getItem];
  
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text=@"互联宝";
    label.textAlignment=NSTextAlignmentCenter;
    //label.backgroundColor=[UIColor lightGrayColor];
    label.textColor=[UIColor whiteColor];
    self.navigationItem.titleView =label;
    
}
-(void)getItem
{
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}



-(void) getTableView
{
    [self.view addSubview:self.tableView];
    LoveView* headView=[[LoveView alloc]initWith:2];
    self.tableView.tableHeaderView=headView;
    [self.tableView registerNib:[UINib nibWithNibName:@"twoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"oneTableViewCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else
    {
        return 4;
    }
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        return cell;
    }else
    {
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 140;
    }else
    {
        return 120;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 10.0;
    }else
    {
        return 30.0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
    
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor=[UIColor clearColor];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.view.frame.size.width, 30)];
    label.text=@"附近的活动";
    [view addSubview:label];
    
    return view;
    }else{
        return nil;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:254/255.0 green:74/255.0 blue:169/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CYDetailViewController* detailVc=[CYDetailViewController new];
    if (indexPath.section==1) {
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}
-(void)getNotifi
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cellBtn:) name:@"cellBtnClick" object:nil];
}
-(void)cellBtn:(NSNotification*)gf
{
    NSInteger index=[gf.userInfo[@"cellBtnClick"] integerValue];
    CYDetailViewController* detailVc=[CYDetailViewController new];
    switch (index) {
        case 0:
            detailVc.titleStr=@"1按钮在完善";
            break;
        case 1:
            detailVc.titleStr=@"2按钮在完善";
            break;
        case 2:
            detailVc.titleStr=@"3按钮在完善";
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:detailVc animated:YES];
    
    
}
@end

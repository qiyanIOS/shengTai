//
//  HappyViewController.m
//  生态圈
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HappyViewController.h"
#import "LoveView.h"
#import "OneHappyTableViewCell.h"
#import "TwoHappyTableViewCell.h"
#import "detailData.h"
#import "CYDetailViewController.h"

@interface HappyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* happyCellArray;

@end

@implementation HappyViewController
-(NSArray*)happyCellArray
{
    if (!_happyCellArray) {
        _happyCellArray=[detailData ModelData];
        
    }
    return _happyCellArray;
}

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView .delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTableView];
    [self getItem];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text=@"快乐盟";
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



-(void)getTableView
{
    [self.view addSubview:self.tableView];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OneHappyTableViewCell" bundle:nil] forCellReuseIdentifier:@"oneCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TwoHappyTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoCell"];
    LoveView* headView=[[LoveView alloc]initWith:3];
    self.tableView.tableHeaderView=headView;
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
        return 2;
    }else
    {
        return 4;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
    
    OneHappyTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        ModelData* data=self.happyCellArray[indexPath.row];
        cell.data=data;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}else
{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"twoCell"];
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
        return 100;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView * view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 30)];
    if (section==0) {
        label.text=@"友趣";
        
    }else
    {
        label.text=@"热门推送";
    }
    [view addSubview:label];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CYDetailViewController* detailVc=[CYDetailViewController new];
    detailVc.titleStr=@"正在完善";
    [self.navigationController pushViewController:detailVc animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:222/255.0 green:64/255.0 blue:22/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}


@end

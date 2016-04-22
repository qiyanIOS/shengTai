//
//  LoveViewController.m
//  生态圈
//
//  Created by apple on 16/3/29.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LoveViewController.h"
#import "LoveView.h"
#import "GYTableViewCell.h"
#import "CYDetailViewController.h"
@interface LoveViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UISearchBar* searchBar;
@end

@implementation LoveViewController
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
    [self initTableView];
    [self getNaviItem];
}
-(void)initTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"GYTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    LoveView* headView=[[LoveView alloc]initWith:1];
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
    return 4;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GYTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];

   

    
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
        return 30.0;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* backView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    backView.backgroundColor=[UIColor colorWithRed:206/255.0 green:15/255.0 blue:22/255.0 alpha:1];
    
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 100, 30)];
    label.backgroundColor=[UIColor clearColor];
    label.textColor=[UIColor whiteColor];
    if (section==0) {
        label.text=@"公益进行中";
    }else
    {
        label.text=@"专题聚焦";
        
    }
    [backView addSubview:label];
    return backView;
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:206/255.0 green:15/255.0 blue:22/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}
-(void)getNaviItem
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    UIColor *color = [UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1];
    titleView.layer.masksToBounds=YES;
    titleView.layer.cornerRadius=5;
    [titleView setBackgroundColor:color];
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.frame = CGRectMake(0, 0, 150, 30);
    _searchBar.placeholder=@"输入查找";
    
    _searchBar.backgroundColor = color;
    [titleView addSubview:_searchBar];
    self.navigationItem.titleView = titleView;
    //右Item
    
    UIBarButtonItem* carmerItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
   
    carmerItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem=carmerItem;
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CYDetailViewController* detailVc=[CYDetailViewController new];
    detailVc.titleStr=@"正在完善";
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end

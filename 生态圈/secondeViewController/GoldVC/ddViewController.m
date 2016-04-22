//
//  ddViewController.m
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ddViewController.h"
#import "BtnTableViewCell.h"
#import "JKView.h"
#import "EndesBtn.h"
#import "CYDetailViewController.h"
#import "payTitle.h"
@interface ddViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)NSArray* payArray;
@property(nonatomic,strong)NSArray* twoPayArray;
@end

@implementation ddViewController
-(NSArray*)payArray
{
    if (!_payArray) {
        _payArray=[payTitle payArray];
    }
    return _payArray;
}
-(NSArray*)twoPayArray
{
    if (!_twoPayArray) {
        _twoPayArray=[payTitle twoPayArray];
    }
    return _twoPayArray;
}
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
    [self setItem];
    
//    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
//    label.text=@"私密金库";
//    label.textColor=[UIColor whiteColor];
//    label.textAlignment=NSTextAlignmentCenter;
//    label.font=[UIFont systemFontOfSize:15];
//    self.navigationItem.titleView=label;
}
-(void)setItem
{
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithTitle:@"账单" style:UIBarButtonItemStylePlain target:nil action:nil];
    [rightItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    rightItem.tintColor=[UIColor whiteColor];
   
    self.navigationItem.rightBarButtonItem=rightItem;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)initTableView
{

    JKView* headView=[JKView JKWithView];
    self.tableView.tableHeaderView=headView;
    
    [EndesBtn btnWithImage:@"tb_06@2x" andTitle:@"扫一扫" andBtn:headView.saoBtn];
    [EndesBtn btnWithImage:@"tb_08@2x" andTitle:@"付款" andBtn:headView.payBtn];
    [EndesBtn btnWithImage:@"tb_03@2x" andTitle:@"兑换" andBtn:headView.DHBtn];
    headView.CZBtn.layer.cornerRadius=5;
    headView.backView.backgroundColor=[UIColor colorWithRed:20/255.0 green:29/255.0 blue:43/255.0 alpha:1];
    [headView.saoBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [headView.payBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [headView.DHBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [headView.shareBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [headView.CZBtn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[BtnTableViewCell class] forCellReuseIdentifier:@"cell"];

    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
}
-(void)click:(UIButton*)button
{
    CYDetailViewController* detailVc=[CYDetailViewController new];
    switch (button.tag) {
        case 0:
            detailVc.titleStr=@"扫一扫正在完善!";
            break;
        case 1:
            detailVc.titleStr=@"付款正在完善!";
            break;
        case 2:
            detailVc.titleStr=@"兑换正在完善!";
            break;
        case 3:
            detailVc.titleStr=@"分享正在完善!";
            break;
        case 4:
            detailVc.titleStr=@"充值兑换正在完善!";
            break;
            
        default:
            break;
            
    }
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.payArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else
    {
        return  self.twoPayArray.count;
    }

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BtnTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section==0) {
    NSArray* array=self.payArray[indexPath.row];
    cell.cellArray=array;
        cell.btnClick=^(UIButton* btn){
            NSLog(@"你点击了%ld行的第%ld个button",(long)indexPath.row,btn.tag);
            [self pushWith:btn];
            
        };
    
       
    }else
    {
        NSArray* array=self.twoPayArray[indexPath.row];
        cell.cellArray=array;
        cell.btnClick=^(UIButton*btn){
            NSLog(@"你点击了%ld行的第%ld个button",(long)indexPath.row,btn.tag);
             [self pushWith:btn];
            
        };
    }
     return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (self.view.frame.size.width/3)-20;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0  green:29/255.0  blue:43/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        return 90.0;
    }else
    {
        return 0.0;
    }
    
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 90)];
        
        UIImageView* imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, 80)];
        imageView.image=[UIImage imageNamed:@"tao"];
        [view addSubview:imageView];
        return view;
    }else
    {
        return nil;
    }
    
}
-(void)pushWith:(UIButton*)btn
{
  
    
    CYDetailViewController* detailVc=[CYDetailViewController new];
    NSString* str=[btn titleForState:UIControlStateNormal ];
    
    detailVc.titleStr=[NSString stringWithFormat:@"%@正在完善！",str];
    
    
    [self.navigationController pushViewController:detailVc animated:YES];
  
    
}

@end

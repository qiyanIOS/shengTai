//
//  LearnViewController.m
//  生态圈
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "LearnViewController.h"
#import "LearnHeadView.h"
#import "oneLearnTableViewCell.h"
#import "twoLearnTableViewCell.h"
#import "threeLearnTableViewCell.h"
#import "CYDetailViewController.h"
@interface LearnViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;


@end

@implementation LearnViewController
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
    [self getItem];
    [self getNaviti];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text=@"学习盟";
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

-(void)getNaviti
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(TwocellBtnClick:) name:@"twoCellBtnClick" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(OnecellBtnClick:) name:@"oneCellBtnClick" object:nil];
   [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(headBtnClick:) name:@"headBtnClick" object:nil];
}
-(void)TwocellBtnClick:(NSNotification*)notification
{
    NSInteger index=[notification.userInfo[@"twoCellBtnClick"]integerValue] ;
    CYDetailViewController* detailVc=[CYDetailViewController new];
    switch (index) {
        case 0:
            detailVc.titleStr=@"课程表正在完善";
            break;
        case 1:
             detailVc.titleStr=@"计算机正在完善";
            break;
        case 2:
             detailVc.titleStr=@"掌上英语正在完善";
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:detailVc animated:YES];
}
-(void)OnecellBtnClick:(NSNotification*)notification
{
    UIButton* button =notification.userInfo[@"oneCellBtnClick"] ;
    CYDetailViewController* detailVc=[CYDetailViewController new];
    switch (button.tag) {
        case 0:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 1:
           detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 2:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 3:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 4:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 5:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 6:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
        case 7:
            detailVc.titleStr=[button titleForState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:detailVc animated:YES];
}
-(void)headBtnClick:(NSNotification*)notification
{
   
    UIButton* button=notification.userInfo[@"headBtnClick"];
    

    CYDetailViewController* detailVc=[CYDetailViewController new];
    switch (button.tag) {
        case 0:
            detailVc.titleStr=@"名师推荐正在完善";
            break;
        case 1:
            detailVc.titleStr=@"名校推荐正在完善";
            break;
        case 2:
            detailVc.titleStr=@"辅导资料正在完善";
            break;
        case 3:
            detailVc.titleStr=@"资讯正在完善";
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:detailVc animated:YES];

}
-(void)initTableView
{
    [self.view addSubview:self.tableView];
   
    [self.tableView registerClass:[oneLearnTableViewCell class] forCellReuseIdentifier:@"oneCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"twoLearnTableViewCell" bundle:nil] forCellReuseIdentifier:@"twoCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"threeLearnTableViewCell" bundle:nil] forCellReuseIdentifier:@"threeCell"];
    LearnHeadView* HeadView=[LearnHeadView new];
    self.tableView.tableHeaderView=HeadView;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }else if(section==1)
    {
        return 1;
    }else
    {
        return 4;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"oneCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section==1)
    {
        twoLearnTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        [self getboard:cell.oneimgView];
        [self getboard:cell.twoimgView];
        [self getboard:cell.threeimgView];
    return cell;
    }else
    {
       threeLearnTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"threeCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
}
-(void)getboard:(UIImageView*)imageView
{
    imageView.layer.cornerRadius=20;
    imageView.layer.masksToBounds=YES;
   imageView.layer.borderColor=[UIColor orangeColor].CGColor;
    imageView.layer.borderWidth=1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        UITableViewCell* cell=[self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
        
    }else if(indexPath.section==1)
    {
        return 120;
    }else
    {
        return 90;
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
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor=[UIColor colorWithRed:33/255.0 green:117/255.0 blue:234/255.0 alpha:1];
    UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 30)];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:15];
    if (section==0) {
        label.text=@"选课导航";
    }
    if (section==1) {
        label.text=@"学习工具";
    }if (section==2)
    
    {
        label.text=@"推荐";
    }
    [view addSubview:label];
    return view;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:24/255.0 green:42/255.0 blue:88/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==2) {
        CYDetailViewController* detailVc=[CYDetailViewController new];
        detailVc.titleStr=@"正在完善";
        [self.navigationController pushViewController:detailVc animated:YES];
    }
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

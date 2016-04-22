//
//  QUViewController.m
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "QUViewController.h"
#import "naviView.h"
#import "CustomSearBar.h"
#import "CityTableViewCell.h"
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height

@interface QUViewController ()<naviViewDelegate,UITableViewDataSource,UITableViewDelegate,customSearBarDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIView* blackView;
@property(nonatomic,strong)naviView* customNaviView;
@property(nonatomic,strong)CustomSearBar*searBarView;
@property(nonatomic,strong)NSMutableArray* dataArray;
@property(nonatomic,strong)NSArray* diweiArray;
@property(nonatomic,strong)NSArray*normalArray;
@property(nonatomic,strong)NSArray* hotCityArray;
@end

@implementation QUViewController
-(UIView*)blackView
{
    if (!_blackView) {
        _blackView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64)];
        _blackView.backgroundColor= [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:0.6];
        _blackView.alpha=0.8;
        
        UITapGestureRecognizer* tapGR=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didSelectedCancleBtn)];
        [_blackView addGestureRecognizer:tapGR];
        
        
        
        
    }
    return _blackView;
}
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.showsVerticalScrollIndicator=NO;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadData];
    
         _customNaviView=[[naviView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 64)];
      _customNaviView.delegate=self;
      [self.view addSubview:_customNaviView];
   _searBarView=[[CustomSearBar alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH,44)];
    _searBarView.delegate=self;
    self.tableView.tableHeaderView=_searBarView;
    
      [self getTableView];
    
}
-(void)getTableView
{
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];//黑色
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
#pragma _mark tableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section<3) {
        return 1;
    }else
    {
        return 10;
    }
}
-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section<3) {
         __weak typeof(self) weakSelf = self;
        CityTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cityCell"];
        if (cell==nil) {
            cell=[[CityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cityCell" cityArray:self.dataArray[indexPath.section]];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.ClickBtnBlock = ^(NSInteger tag)
        {
            if (indexPath.section==0) {
               
                _selectedStr(weakSelf.diweiArray[tag]);
            }else if(indexPath.section==1)
            {
               _selectedStr(weakSelf.normalArray[tag]);
            }else
            {
                 _selectedStr(weakSelf.hotCityArray[tag]);
            }
            [self dismissViewControllerAnimated:YES completion:nil];

        };
        

        return cell;
    }else
    {
    
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section<2) {
        return 55;
    }else if(indexPath.section==2)
    {
        return 145;
    }else
    {
        return 44;
    }
}
#pragma _mark naviViewDelegate
-(void)backBtnDidClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma _mark CustomSearchBarDelegate
-(void)didBeginEiding
{
    [self.view addSubview:self.blackView];
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.customNaviView.frame=CGRectMake(0, -64, SCREENWIDTH, 64);
        self.tableView.frame=CGRectMake(0, 20, SCREENWIDTH, SCREENHEIGHT);
        
        
    } completion:^(BOOL finished) {
        
        UIView* statueView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 20)];
        statueView.backgroundColor=[UIColor lightGrayColor];
        statueView.tag=1000;
        [self.view addSubview:statueView];
        
    }];
}
-(void)didSearchString:(NSString *)string
{
    
}
-(void)didSelectedCancleBtn
{
    [self.blackView removeFromSuperview];
    self.blackView=nil;
    UIView* statueView=(UIView*)[self.view viewWithTag:1000];
    [statueView removeFromSuperview];
    [self.searBarView.searchBar resignFirstResponder];
    [self.searBarView.searchBar setShowsCancelButton:NO animated:YES];
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.customNaviView.frame=CGRectMake(0, 0, SCREENWIDTH, 64);
        self.tableView.frame=CGRectMake(0, 64, SCREENWIDTH, SCREENHEIGHT-64);
        
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)loadData
{
    self.dataArray=[NSMutableArray array];
    self.diweiArray=@[@"西安"];
    self.normalArray=@[@"西安",@"宝鸡"];
    self.hotCityArray= @[@"上海",@"北京",@"广州",@"深圳",@"武汉",@"天津",@"西安",@"南京",@"杭州"];
    [self.dataArray insertObject:self.hotCityArray atIndex:0];
    [self.dataArray insertObject:self.normalArray atIndex:0];
    [self.dataArray insertObject:self.diweiArray atIndex:0];
    
    
    
}
@end

//
//  HomeViewController.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "regionView.h"
#import "shaoView.h"
#import "didanView.h"
#import "SC-HomeHeardView.h"
#import "OneSectionTableViewCell.h"
#import "SDCycleScrollView.h"
#import "chuanViewController.h"
#import "shenhuoViewController.h"
#import "GoldViewController.h"
#import "LoveViewController.h"
#import "ddViewController.h"
#import "InterViewController.h"
#import "HappyViewController.h"
#import "FangViewController.h"
#import "LearnViewController.h"
#import "GondCViewController.h"
#import "QUViewController.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)SDCycleScrollView* cycleScrollView;
@property(nonatomic,strong)UISearchBar* searchBar;
@property(nonatomic,strong)SC_HomeHeardView*heardTableView;
@property(nonatomic,strong)regionView* regionItem;
@property(nonatomic,strong)NSDictionary*bigDic;
@end

@implementation HomeViewController
#define cycScrollViewY  110

-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
    }
    return _tableView;
}
-(instancetype)init
{
    if (self=[super init]) {
        self.tabBarItem.image=[UIImage imageNamed:@"home" ];
        
        self.tabBarItem.selectedImage=[[UIImage imageNamed:@"homeSelected@2x"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.title=@"淘金猫";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self navigationItemBar];
    [self item];
    [self initTableView];
    
}

-(void)cancelKeyboard:(UITapGestureRecognizer* )gr
{
    NSLog(@"dd");
 
    [_searchBar resignFirstResponder];
   
}
-(void)navigationItemBar
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
    
    //Set to titleView
    self.navigationItem.titleView = titleView;
    UITapGestureRecognizer* tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancelKeyboard:)];
    [self.tableView addGestureRecognizer:tap];
   
}
-(void)item
{
    _regionItem=[regionView regionVIew];
    UIBarButtonItem* firstItem=[[UIBarButtonItem alloc]initWithCustomView:_regionItem];
    [_regionItem.regionButton addTarget:self action:@selector(regionButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
   
    shaoView* saoItem=[shaoView saoView];
    UIBarButtonItem* twoItem=[[UIBarButtonItem alloc]initWithCustomView:saoItem];
    self.navigationItem.leftBarButtonItems=@[firstItem,twoItem];
    didanView * didanItem=[didanView dingDanView];
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithCustomView:didanItem];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}


-(void)regionButtonClick
{
  
    QUViewController * csVc=[[QUViewController alloc]init];
    csVc.selectedStr=^(NSString*string)
    {
        self.regionItem.regionLabel.text=string;
    };
    [self presentViewController:csVc animated:YES completion:nil];
   
    }

-(void)initTableView
{
    [self.view addSubview:self.tableView];

    SC_HomeHeardView* headView=[[SC_HomeHeardView alloc]initWithIndex:1];
    self.tableView.tableHeaderView=headView;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"OneSectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"twoCell"];
    
    [self pushVc];
    
}
-(void)pushVc
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(push:) name:@"buttonClick" object:nil];
   
    
}
-(void)push:(NSNotification*)notification
{
    NSInteger tag=[notification.userInfo[@"buttonClick"] integerValue];
    if (tag==0) {
        shenhuoViewController* shenhuoVc=[shenhuoViewController new];
        shenhuoVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:shenhuoVc animated:YES];
    }
    if (tag==1) {
        GondCViewController* GCVc=[GondCViewController new];
        GCVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:GCVc animated:YES];
    }
    if (tag==2) {
        FangViewController* fangVc=[FangViewController new];
        fangVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:fangVc animated:YES];
    }
    if (tag==3) {
        GoldViewController* GoldVc=[GoldViewController new];
        GoldVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:GoldVc animated:YES];
    }if (tag==5) {
        NSLog(@"dd");
        ddViewController* jkVc=[ddViewController new];
        //self.navigationController.navigationBar.translucent = NO;
        jkVc.navigationController.navigationBar.translucent=NO;
        jkVc.hidesBottomBarWhenPushed=YES;
        
        [self.navigationController pushViewController:jkVc animated:YES];
    }
    if (tag==6) {
        InterViewController* interVc=[InterViewController new];
        interVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:interVc animated:YES];
    }
    if (tag==8) {
        LearnViewController* learnVc=[LearnViewController new];
        learnVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:learnVc animated:YES];
    }
    if (tag==9) {
        chuanViewController* chuanVc=[chuanViewController new];
        chuanVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:chuanVc animated:YES];
    }
    if (tag==10) {
        HappyViewController* happyVc=[HappyViewController new];
        happyVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:happyVc animated:YES];
    }
    if (tag==11) {
        LoveViewController* loveVc=[LoveViewController new];
        loveVc.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:loveVc animated:YES];
    }

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
  
    OneSectionTableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
      
     cell.timestamp=2*3600;
        
        
    return cell;
    }else
    {
        UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"twoCell"];
        return cell;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 10;
    }else
    {
        return 0.1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 200;
    }else
    {
        return 44;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return cycScrollViewY;
    }else
    {
        return 0.1;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0) {
    
        UIView* view=[[UIView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, cycScrollViewY)];
        view.backgroundColor=[UIColor clearColor];
        
        
        // 创建不带标题的图片轮播器
         NSArray *images = @[[UIImage imageNamed:@"g1.jpg"],[UIImage imageNamed:@"g2.jpg"]];
            _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 2, self.view.frame.size.width, cycScrollViewY-4) imagesGroup:images];
            //_cycleScrollView.delegate = self;
            _cycleScrollView.autoScrollTimeInterval = 2.0;
        [view addSubview:_cycleScrollView];
        
        return view;
    }else
    {
        return nil;
    }
    
}
@end

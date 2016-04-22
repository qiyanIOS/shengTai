//
//  shenhuoViewController.m
//  生态圈
//
//  Created by apple on 16/3/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "shenhuoViewController.h"
#import "shenHuoView.h"
#import "ToolCollectionViewCell.h"
#import "ListCollectionViewCell.h"
#import "CYDetailViewController.h"

@interface shenhuoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView*collection;
@property(nonatomic,strong)shenHuoView* shenHuo;
@property(nonatomic,strong)UISearchBar* searchBar;


@end

@implementation shenhuoViewController
-(UICollectionView*)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
        _collection=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _collection.delegate=self;
        _collection.dataSource=self;
       
        [_collection registerNib:[UINib nibWithNibName:@"ToolCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"toolCell"];
        [_collection registerNib:[UINib nibWithNibName:@"ListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"phoneCell"];
        
    }
    return _collection;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self getNaviItem];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:251/255.0  green:107/255.0  blue:24/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
    
}


-(void)initTableView
{


    [self.view addSubview:self.collection];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse"];
    
      _shenHuo=[shenHuoView new];
}
-(void)getNaviItem
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    //UIColor *color = [UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1];
    titleView.layer.masksToBounds=YES;
    titleView.layer.cornerRadius=5;
    //[titleView setBackgroundColor:color];
//    _searchBar = [[UISearchBar alloc] init];
//    _searchBar.frame = CGRectMake(0, 0, 150, 30);
//    _searchBar.placeholder=@"创业搜一下";
//    
//    _searchBar.backgroundColor = color;
    UIButton* button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=titleView.frame;
    button.titleLabel.font=[UIFont systemFontOfSize:17];
    [button setTitle:@"明园小区" forState:UIControlStateNormal];
    
    NSDictionary *attributes = @{NSFontAttributeName:button.titleLabel.font};
    CGFloat length = [button.titleLabel.text boundingRectWithSize:CGSizeMake(320, 2000) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width;
    [button setImage:[UIImage imageNamed:@"bottom"] forState:UIControlStateNormal];
  button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.backgroundColor=[UIColor grayColor];
    
   // button.titleEdgeInsets=UIEdgeInsetsMake(0, 0, 0, button.frame.size.width-length-34);
    button.imageEdgeInsets=UIEdgeInsetsMake(0, length/2+button.frame.size.width/2, 0, 0);
    button.backgroundColor=[UIColor clearColor] ;
    [button addTarget:self action:@selector(selectRegion) forControlEvents:UIControlEventTouchUpInside];

    
    
    [titleView addSubview:button];
    self.navigationItem.titleView = titleView;
    //右Item
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:nil action:nil];
    rightItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem=rightItem;
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)selectRegion
{
    NSLog(@"选小区");
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else
    {
        return 8;
    }
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        ToolCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"toolCell" forIndexPath:indexPath];
        if (indexPath.row==1) {
            cell.toolImage.image=[UIImage imageNamed:@"car"];
            cell.bigTitle.text=@"违章驾驶";
            cell.smallTitle.text=@"安全驾驶 路路放心";
        }
        return cell;
    }else
    {
    
    UICollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"phoneCell" forIndexPath:indexPath];
    
    cell.backgroundColor=[UIColor whiteColor];
    cell.layer.borderColor=[[UIColor lightGrayColor]CGColor];
    cell.layer.borderWidth=0.5;
    cell.layer.masksToBounds=YES;
    return cell;
    }
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        UIEdgeInsets top={0.f,0.f,0.f,0.f};
        return top;
    }else
    {
        UIEdgeInsets top={0,10,20,10};
        return top;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return CGSizeMake((self.view.frame.size.width-1)/2, 120);
    }else
    {
        return CGSizeMake((self.view.frame.size.width-40)/2, 200);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        return 0.0f;
    }else
    {
        return 10.0f;
    }
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        return 0.f;
    }else
    {
        return 0;
    }
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
 
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse" forIndexPath:indexPath];
    if (indexPath.section==0) {
        
        view.backgroundColor=[UIColor redColor];
        
        [view addSubview:_shenHuo];
        return view;
    }else
    {
        view.backgroundColor=[UIColor clearColor];
        UILabel* label=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 30)];
        label.text=@"限时优惠";
        label.font=[UIFont systemFontOfSize:14];
        //label.textColor=[UIColor lightGrayColor];
        //label.textColor=[UIColor colorWithRed:100/255.0  green:171/255.0  blue:31/255.0 alpha:1];
        label.textColor=[UIColor colorWithRed:251/255.0  green:107/255.0  blue:24/255.0 alpha:1];
        [view addSubview:label];
        return view;
    }
    
    
    

}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        NSLog(@"dd%f",self.shenHuo.frame.size.height);
        return CGSizeMake(320, self.shenHuo.frame.size.height);
        
    }else
    {
    return CGSizeMake(10,30);
    }
}
//跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CYDetailViewController* detailVc=[CYDetailViewController new];
   
    if (indexPath.section==0) {
        detailVc.titleStr=[NSString stringWithFormat:@"今日热点%ld正在完善！",indexPath.row];
        if(indexPath.row==0)
        {
            detailVc.titleStr=@"预约挂号正在完善!";
        }else
        {
            detailVc.titleStr=@"违章驾驶正在完善";
        }
        
    }else if(indexPath.section==1)
    {
        detailVc.titleStr=[NSString stringWithFormat:@"限时优惠%ld正在完善！",indexPath.row];
        
        
    }
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end

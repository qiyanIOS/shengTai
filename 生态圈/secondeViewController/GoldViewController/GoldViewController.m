//
//  GoldViewController.m
//  生态圈
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "GoldViewController.h"
#import "SDCycleScrollView.h"
#import "travelView.h"
#import "GoldData.h"
#import "GoldCollectionViewCell.h"
#import "YHCollectionViewCell.h"
#import "CYDetailViewController.h"

@interface GoldViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView* collection;
@property(nonatomic,strong)UISearchBar*searchBar;
@property(nonatomic,strong)SDCycleScrollView* cycleScrollView;
@property(nonatomic,strong)UILabel* goLabel;
@property(nonatomic,strong)travelView* heardView;
@property(nonatomic,strong)NSArray* nameArray;
@property(nonatomic,strong)NSArray* travelArray;
@property(nonatomic,strong)NSArray* otherArray;
@property(nonatomic,strong)NSArray* allArray;
@end

@implementation GoldViewController
-(NSArray*)nameArray
{
    if(!_nameArray){
        _nameArray=[GoldData titleArray];
        }
      return _nameArray;
}
-(NSArray*)travelArray
{
    if(!_travelArray){
        _travelArray=[GoldData travelArray];
    }
    return _travelArray;
}
-(NSArray*)otherArray
{
    if(!_otherArray){
        _otherArray=[GoldData othreArray];
    }
    return _otherArray;
}
-(NSArray*)allArray
{
    if (!_allArray) {
        _allArray=[GoldData allArray];
    }
    return _allArray;
}
-(UICollectionView*)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collection=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.backgroundColor=[UIColor whiteColor];
        _collection.delegate=self;
        _collection.dataSource=self;
        
        [_collection registerClass:[GoldCollectionViewCell class] forCellWithReuseIdentifier:@"goldCell"];
         [_collection registerClass:[GoldCollectionViewCell class] forCellWithReuseIdentifier:@"travlCell"];
         [_collection registerClass:[GoldCollectionViewCell class] forCellWithReuseIdentifier:@"otherCell"];
        [_collection registerNib:[UINib nibWithNibName:@"YHCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _collection;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCollection];
    [self getNaviItem];
    
   
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
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithTitle:@"订单" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem* carmerItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    rightItem.tintColor=[UIColor whiteColor];
    carmerItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItems=@[rightItem,carmerItem];
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(instancetype)init
{
    if (self=[super init]) {
        _heardView=[[travelView alloc]init];
    }
    return self;
    
}
-(void)initCollection
{
    [self.view addSubview:self.collection];
    
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"two"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"three"];
     [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"four"];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 8;
            break;
        case 1:
            return 8;
            break;
        case 2:
            return 3;
            break;
        case 3:
            return self.allArray.count;
            break;
            
        default:
            return 0;
            break;
    }
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0) {
        
 GoldCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"goldCell" forIndexPath:indexPath];
   
        GoldData* data=self.nameArray[indexPath.row];
        cell.data=data;
    

       return cell;
    }else if(indexPath.section==1)
    {
        GoldCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"travlCell" forIndexPath:indexPath];
        GoldData* travelData=self.travelArray[indexPath.row];
        
        cell.travelData=travelData;
        return cell;
    }
    else if(indexPath.section==2)
    {
        GoldCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"otherCell" forIndexPath:indexPath];
        GoldData* otherData=self.otherArray[indexPath.row];
       
        cell.otherData=otherData;
        return cell;
    }
    else
    {
  YHCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        GoldData* data=self.allArray[indexPath.row];
        cell.data=data;
        return cell;
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
        UIEdgeInsets top={5.f,10.f,5.f,10.f};
        return top;
   
    
    
}
//cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return CGSizeMake((self.view.frame.size.width-20-15)/4, 40);
    }else if(indexPath.section==1)
    {
        return CGSizeMake((self.view.frame.size.width-20-15)/4, 40);
    }else if(indexPath.section==2)
    {
        return CGSizeMake((self.view.frame.size.width-20-20)/3, 40);
    }else
    {
        return CGSizeMake((self.view.frame.size.width-20-15)/3, 120);
    }
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        //return 0.5f;
        return 5.f;
    }else if(section==1)
    {
        return 5.0f;
    }else if(section==2){
        return 10.f;
    }else
    {
        return 5.f;
    }
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
 
    _goLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 25)];
    //_goLabel.textColor=[UIColor lightGrayColor];
    _goLabel.font=[UIFont systemFontOfSize:14];

    if (indexPath.section==0) {
        
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse" forIndexPath:indexPath];
        [view addSubview:_heardView];
        return view;
    }else if(indexPath.section==1)
    {
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"two" forIndexPath:indexPath];
        
        view.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _goLabel.textColor=[UIColor colorWithRed:239.0/255 green:129.0/255 blue:19.0/255 alpha:1];
        self.goLabel.text=@"旅游";
        
        
        [view addSubview:self.goLabel];
        return view;
    }else if(indexPath.section==2)
    {
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"three" forIndexPath:indexPath];
        view.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _goLabel.textColor=[UIColor colorWithRed:35.0/255 green:139.0/255 blue:82.0/255 alpha:1];
        self.goLabel.text=@"其他";
        
        [view addSubview:self.goLabel];
        return view;
        
    }else
    {
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"four" forIndexPath:indexPath];
        view.backgroundColor=[UIColor groupTableViewBackgroundColor];
        self.goLabel.text=@"特价优惠";
        _goLabel.textColor=[UIColor redColor];
        [view addSubview:self.goLabel];
        return view;
    }
    
    
    
    
    
//-(UILabel*)goLabel
//{
   // if (!_goLabel) {
        //_goLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 30)];
        //_goLabel.
    //}
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(320, _heardView.frame.size.height);
    }else
    {
        return CGSizeMake(320,25);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20.0/255.0  green:153.0/255.0  blue:140.0/255.0 alpha:1]];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:34/255.0  green:153/255.0  blue:218/255.0 alpha:1]];
    
}
//跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CYDetailViewController* detailVc=[CYDetailViewController new];
    detailVc.hidesBottomBarWhenPushed=YES;
    
    if (indexPath.section==0) {
        GoldData* data=self.nameArray[indexPath.row];
        detailVc.titleStr=[NSString stringWithFormat:@"%@正在完善!",data.title];
    }else if(indexPath.section==1)
    {
        GoldData* data=self.travelArray[indexPath.row];
         detailVc.titleStr=[NSString stringWithFormat:@"%@正在完善!",data.title];
    }else if(indexPath.section==2)
    {
        GoldData* data=self.otherArray[indexPath.row];
         detailVc.titleStr=[NSString stringWithFormat:@"%@正在完善!",data.title];
    }else
    {
        GoldData* data=self.allArray[indexPath.row];
        detailVc.titleStr=[NSString stringWithFormat:@"%@优惠正在完善!",data.hotelTitle];
    }
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end

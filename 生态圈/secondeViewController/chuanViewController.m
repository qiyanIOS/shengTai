
#import "chuanViewController.h"
#import "shenHuoView.h"
#import "SC-HomeHeardView.h"
#import "LineCollectionViewCell.h"
#import "PhoneCollectionViewCell.h"
#import "CYDetailViewController.h"
#import "CollectionViewCell.h"
@interface chuanViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView*collection;

@property(nonatomic,strong)SC_HomeHeardView* headView;
@property(nonatomic,strong)UISearchBar* searchBar;
@property(nonatomic,strong)UILabel* sectionLabel;
@property(nonatomic,strong)UILabel* twoSectionLabel;

@end

@implementation chuanViewController
-(UICollectionView*)collection
{
    if (!_collection) {
        UICollectionViewFlowLayout* layout=[[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        _collection=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collection.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _collection.delegate=self;
        _collection.dataSource=self;
        [_collection registerNib:[UINib nibWithNibName:@"LineCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"lineCell"];
        [_collection registerNib:[UINib nibWithNibName:@"PhoneCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"phoneCell"];
        [_collection registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collCell"];
        
    }
    return _collection;
    
}
-(SC_HomeHeardView*)headView
{
    if (!_headView) {
        _headView=[[SC_HomeHeardView alloc]initWithIndex:2];
    }
    return _headView;
}
-(UILabel*)sectionLabel
{
    if (!_sectionLabel) {
        _sectionLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 30)];
       _sectionLabel.font=[UIFont systemFontOfSize:15];
        _sectionLabel.textColor=[UIColor colorWithRed:201/255.0  green:0/255.0  blue:22/255.0 alpha:1];

    }
    return _sectionLabel;
}
-(UILabel*)twoSectionLabel
{
    if (!_twoSectionLabel) {
        _twoSectionLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.frame.size.width, 30)];
        _twoSectionLabel.font=[UIFont systemFontOfSize:15];
        _twoSectionLabel.textColor=[UIColor colorWithRed:201/255.0  green:0/255.0  blue:22/255.0 alpha:1];

    }
    return _twoSectionLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self  getNaviItem];
   
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:201/255.0  green:0/255.0  blue:22/255.0 alpha:1]];
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
    _searchBar.placeholder=@"创业搜一下";
    
    _searchBar.backgroundColor = color;
    [titleView addSubview:_searchBar];
    self.navigationItem.titleView = titleView;
    //右Item
    UIBarButtonItem* rightItem=[[UIBarButtonItem alloc]initWithTitle:@"社区" style:UIBarButtonItemStylePlain target:nil action:nil];
    rightItem.tintColor=[UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem=rightItem;
    UIBarButtonItem* backItem=[[UIBarButtonItem alloc]initWithImage: [[UIImage imageNamed:@"back"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.leftBarButtonItem=backItem;
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)initTableView
{
    
    
    [self.view addSubview:self.collection];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"two"];
    [self.collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"three"];
    
   // _headView=[[SC_HomeHeardView alloc]initWithIndex:2];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 2;
    }else if(section==1)
    {
        return 4;
    }else
    {
        return 4;
    }
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        //LineCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"lineCell" forIndexPath:indexPath];
        CollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"collCell" forIndexPath:indexPath];
        return cell;
    }else
    {
        
        PhoneCollectionViewCell* cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"phoneCell" forIndexPath:indexPath];
        
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
        UIEdgeInsets top={0,10,0,10};
        return top;
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        //return CGSizeMake(self.view.frame.size.width, 70);
        return CGSizeMake(self.view.frame.size.width, 250);
    }else if(indexPath.section==1)
    {
        return CGSizeMake((self.view.frame.size.width-30)/2, 140);
    }else
    {
        return CGSizeMake((self.view.frame.size.width-30)/2, 140);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    if (section==0) {
        //return 0.5f;
        return 10.f;
    }else if(section==1)
    {
        return 10.0f;
    }else{
        return 10.f;
    }
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section==0) {
        
       UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerReuse" forIndexPath:indexPath];
        [view addSubview:_headView];
       return view;
    }else if(indexPath.section==1)
    {
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"two" forIndexPath:indexPath];
        view.backgroundColor=[UIColor clearColor];
       
        
            self.sectionLabel.text=@"精选导读";
       
        
        [view addSubview:self.sectionLabel];
        return view;
    }else
    {
        UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"three" forIndexPath:indexPath];
        self.twoSectionLabel.text=@"经验分享";
        [view addSubview:self.twoSectionLabel];
        return view;
        
    }
    
    
    
  
    
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return CGSizeMake(320, self.headView.frame.size.height);
    }else if(section==1)
    {
        return CGSizeMake(320,30);
    }else
    {
        return CGSizeMake(320,30);
    }
}
//跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CYDetailViewController* vc=[CYDetailViewController new];
    if (indexPath.section==0) {
        vc.titleStr=[NSString stringWithFormat:@"今日热点%ld正在完善！",indexPath.row];
        
    }else if(indexPath.section==1)
    {
        vc.titleStr=[NSString stringWithFormat:@"精选导读%ld正在完善！",indexPath.row];
        
        
    }else
    {
        vc.titleStr=[NSString stringWithFormat:@"分享经验%ld正在完善！",indexPath.row];
      
      
    }
      [self.navigationController pushViewController:vc animated:YES];
}

@end

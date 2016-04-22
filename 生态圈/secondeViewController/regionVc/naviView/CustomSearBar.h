//
//  CustomSearBar.h
//  生态圈
//
//  Created by apple on 16/4/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol customSearBarDelegate<NSObject>
-(void)didBeginEiding;
-(void)didSearchString:(NSString*)string;
-(void)didSelectedCancleBtn;
@end
@interface CustomSearBar : UIView<UISearchBarDelegate>
@property(nonatomic,assign)id<customSearBarDelegate>delegate;
@property(nonatomic,strong)UISearchBar* searchBar ;
@end

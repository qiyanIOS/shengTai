//
//  payTitle.m
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "payTitle.h"

@implementation payTitle
+(NSArray*)payArray
{
    payTitle* g=[payTitle new];
    g.title=@"转赠";
    g.imageStr=@"991";
    
    payTitle* g1=[payTitle new];
    g1.title=@"收益";
    g1.imageStr=@"992";
    
    payTitle* g2=[payTitle new];
    g2.title=@"余额";
    g2.imageStr=@"993";
    
    payTitle* g3=[payTitle new];
    g3.title=@"银行卡";
    g3.imageStr=@"994";
    
    payTitle* g4=[payTitle new];
    g4.title=@"记忆记录";
    g4.imageStr=@"995";
    
    payTitle* g5=[payTitle new];
    g5.title=@"理财";
    g5.imageStr=@"996";
    
    
    NSArray* oneArray=@[g,g1,g2];
    NSArray* twoArray=@[g3,g4,g5];
    
    return @[oneArray,twoArray];
    
}
+(NSArray*)twoPayArray
{
    payTitle* g6=[payTitle new];
    g6.title=@"爱心";
    g6.imageStr=@"21";
    
    payTitle* g7=[payTitle new];
    g7.title=@"卡券";
    g7.imageStr=@"22";
    
    payTitle* g8=[payTitle new];
    g8.title=@"汇率";
    g8.imageStr=@"23";
    
    payTitle* g9=[payTitle new];
    g9.title=@"生活通";
    g9.imageStr=@"24";
    
    
    payTitle* g10=[payTitle new];
    g10.title=@"淘工厂";
    g10.imageStr=@"25";
    
    payTitle* g11=[payTitle new];
    g11.title=@"抢钱宝";
    g11.imageStr=@"26";
    
    payTitle* g12=[payTitle new];
    g12.title=@"地球村";
    g12.imageStr=@"27";
    
    

    payTitle* g13=[payTitle new];
    g13.title=@"股票";
    g13.imageStr=@"28";
    
    payTitle* g14=[payTitle new];
    g14.title=@"更多";
    g14.imageStr=@"29";
    
    
    
    NSArray* oneArray=@[g6,g7,g8];
    NSArray* twoArray=@[g9,g10,g11];
    NSArray* threeArray=@[g12,g13,g14];
    return @[oneArray,twoArray,threeArray];


}
@end

//
//  payTitle.h
//  生态圈
//
//  Created by apple on 16/3/28.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface payTitle : NSObject
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSString* imageStr;
+(NSArray*)payArray;
+(NSArray*)twoPayArray;
@end

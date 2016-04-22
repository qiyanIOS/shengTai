//
//  titleModel.m
//  生态圈
//
//  Created by apple on 16/3/16.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "titleModel.h"

@implementation titleModel
+(NSArray*)titleArray
{
    titleModel* model=[titleModel new];
    model.title=@"生活通";
    titleModel* model1=[titleModel new];
     model1.title=@"工厂通";
    titleModel* model2=[titleModel new];
    model2.title=@"房博村";
    titleModel* model3=[titleModel new];
    model3.title=@"地球村";
    titleModel* model4=[titleModel new];
    model4.title=@"抢钱包";
    titleModel* model5=[titleModel new];
    model5.title=@"金库";
    titleModel* model6=[titleModel new];
    model6.title=@"互联宝";
    titleModel* model7=[titleModel new];
    model7.title=@"神搜宝";
    titleModel* model8=[titleModel new];
    model8.title=@"学习盟";
    titleModel* model9=[titleModel new];
    model9.title=@"创客盟";
    titleModel* model10=[titleModel new];
    model10.title=@"快乐盟";
    titleModel* model11=[titleModel new];
    model11.title=@"爱心盟";
    
    //创业盟title
    titleModel* data=[titleModel new];
    data.title=@"创业项目";
    titleModel* data1=[titleModel new];
    data1.title=@"创业互助";
    titleModel* data2=[titleModel new];
    data2.title=@"创业服务";
    titleModel* data3=[titleModel new];
    data3.title=@"众筹平台";
    titleModel* data4=[titleModel new];
    data4.title=@"创业话题";
    titleModel* data5=[titleModel new];
    data5.title=@"创业导师";
    titleModel* data6=[titleModel new];
    data6.title=@"创业活动";
    titleModel* data7=[titleModel new];
    data7.title=@"更多";
    
    
  NSArray* array1= @[model,model1,model2,model3,model4,model5,model6,model7,model8,model9,model10,model11];
    NSArray* array2=@[data,data1,data2,data3,data4,data5,data6,data7];
    return @[array1,array2];
}
@end

//
//  FangViewController.m
//  生态圈
//
//  Created by apple on 16/3/31.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "FangViewController.h"

@interface FangViewController ()
@property(nonatomic,strong)UIWebView* webView;
@end

@implementation FangViewController
-(UIWebView*)webView
{
    if (!_webView) {
        _webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
        //_webView.delegate=self;
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}
//-(void)webViewDidStartLoad:(UIWebView *)webView
//{
//    
//}
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    
//}
//-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
//{
//    NSLog(@"%@",error.userInfo);
//}
-(void)viewWillAppear:(BOOL)animated
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.hao123.com"]]];
    [self.view addSubview:self.webView];
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.webView.delegate=nil;
    [self.webView removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
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

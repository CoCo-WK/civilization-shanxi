//
//  TwoViewController.m
//  文明陕西
//
//  Created by dc004 on 15/12/15.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
{
    UIButton *backButton;
    UIButton *forwordButton;
    UIWebView *webView;
    UILabel *label;
}
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
}
-(void)layout{
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 55, 375, 600)];
    NSString *str = @"http://m.weibo.cn/3607648484";
    NSURL *url = [NSURL URLWithString:str];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
//    label = [[UILabel alloc]initWithFrame:CGRectMake(80, 52, 200, 30)];
//    label.text = @"个人主页";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.textColor = [UIColor blackColor];
//    label.layer.borderWidth = 0.3;
//    label.layer.borderColor = [UIColor grayColor].CGColor;
//    label.layer.cornerRadius = 7;
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(3, 20, 183, 30)];
    forwordButton = [[UIButton alloc]initWithFrame:CGRectMake(189, 20, 183, 30)];
    [backButton setTitle:@"⬅️" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    backButton.layer.borderWidth = 0.5;
    backButton.layer.borderColor = [UIColor grayColor].CGColor;
    [forwordButton setTitle:@"➡️" forState:UIControlStateNormal];
    [forwordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forwordButton.layer.borderWidth = 0.5;
    forwordButton.layer.borderColor = [UIColor grayColor].CGColor;
    backButton.backgroundColor = [UIColor whiteColor];
    forwordButton.backgroundColor = [UIColor whiteColor];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [forwordButton addTarget:self action:@selector(forword) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:label];
    [self.view addSubview:backButton];
    [self.view addSubview:forwordButton];
    [self.view addSubview:webView];
}
-(void)back{
    [webView goBack];
}
-(void)forword{
    [webView goForward];
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

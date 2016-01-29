//
//  ClickViewController.m
//  文明陕西
//
//  Created by dc004 on 15/12/16.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ClickViewController.h"

@interface ClickViewController ()
{
    UIWebView *webView;
    UIButton *backButton;
}
@end

@implementation ClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
}
-(void)layout{
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 40, 375, 667)];
    NSURL *url = [NSURL URLWithString:_str];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 12, 30, 30)];
    [backButton setTitle:@"⬅️" forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    [self.view addSubview:webView];
    
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
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

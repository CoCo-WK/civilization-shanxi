//
//  ViewController.h
//  文明陕西
//
//  Created by dc004 on 15/12/15.
//  Copyright © 2015年 gang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,strong)NSArray *arrayText;
//滚动视图
@property (nonatomic,strong) UIScrollView *scrollView;
//页码
@property (nonatomic,strong) UIPageControl *pageControl;
//定时器
@property (nonatomic,strong) NSTimer *timer;
//图片数量
@property (nonatomic,assign) int imageTotal;

@end


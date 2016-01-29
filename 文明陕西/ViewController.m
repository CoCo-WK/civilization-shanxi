//
//  ViewController.m
//  文明陕西
//
//  Created by dc004 on 15/12/15.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ViewController.h"
#import "ClickViewController.h"
#import "HeadTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UIScrollView *_scroll;
    NSArray *urlArray;
    NSArray *titleArray;
    NSString *urlStr;
    ClickViewController *clickView;
    NSArray *_array;
    UIImageView *image;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arrayText = @[@"壶口瀑布",@"华山",@"秦始皇兵马俑",@"大雁塔",@"钟楼",@"大唐芙蓉园",@"华清池",@"柞水溶洞",@"太白山",@"阿房宫"];
    _array=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    urlArray = @[@"http://lvyou.baidu.com/hukoupubu",@"http://lvyou.baidu.com/huashan",@"http://lvyou.baidu.com/qinshihuangbingmayong",@"http://lvyou.baidu.com/dayanta",@"http://lvyou.baidu.com/xianzhonglou",@"http://lvyou.baidu.com/datangfurongyuanv",@"http://lvyou.baidu.com/huaqingchi",@"http://baike.baidu.com/link?url=NMBAf_fjgNohGchoqlGCdY4wO5BG8Js3NoyUNWL0vi6rQjn3PR9Cq6cheGj6gO46Z5q7NFKRJrhBjXBcTvI_0_",@"http://baike.baidu.com/view/2156.htm",@"http://baike.baidu.com/subview/8492/10197375.htm"];
    [self layout];
    [self method];
}

-(void)layout{
    
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, 375, 667)];
    _scroll.contentSize = CGSizeMake(0, 780);
   
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 375, 667) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   
    [self.view addSubview:_scroll];
    [_scroll addSubview:_tableView];
   
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    clickView = [[ClickViewController alloc]init];
    clickView.str = urlArray[indexPath.row];
    NSLog(@"%@", clickView.str);
    [self presentViewController:clickView animated:YES completion:nil];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayText.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[HeadTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.titleLabel.text = @"文明陕西";
    cell.label.text = _arrayText[indexPath.row];
    cell.imageview.image=[UIImage imageNamed:[NSString stringWithFormat:@"HKPB%@",_array[indexPath.row]]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 220;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)method{
    //1 设置 image
    //图片位置
    CGFloat imageH = self.scrollView.frame.size.height;
    CGFloat imageW = self.scrollView.frame.size.width;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    
    for (int i=0; i<self.imageTotal; i++) {
        image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 375, 220)];

        image.image=[UIImage imageNamed:[NSString stringWithFormat:@"hh%i",i]];
        imageX = i * imageW;
        image.frame=CGRectMake(imageX, imageY, imageW, imageH);
        [self.scrollView addSubview:image];
    }
    
    
    
    //2 设置 scrollView
    //隐藏进度条
    self.scrollView.showsHorizontalScrollIndicator=NO;
    
    //设置拖拽范围
    CGFloat sizeW = self.imageTotal*imageW;
    self.scrollView.contentSize =CGSizeMake(sizeW, 0);
    
    //设置分页
    self.scrollView.pagingEnabled=YES;
    
    
    //监听scrollView 滚动
    self.scrollView.delegate=self;
    
    
    
    //3 设置 pageControl
    //设置共用多少页
    self.pageControl.numberOfPages= self.imageTotal;
    
    //设置其他页码颜色 绿色
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    
    //设置当前页码颜色 红色
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    
    
    //4.添加定时器
    [self addTimer];
}

#pragma mark - 图片调用方法
/**
 *  下一张图片
 */
-(void)nextImage
{
    NSInteger page = self.pageControl.currentPage;
    if (page==(self.imageTotal-1)) {
        page=0;
    }else{
        page++;
    }
    self.scrollView.contentOffset=CGPointMake(page*self.scrollView.frame.size.width, 0);
}




#pragma mark - timer方法
/**
 *  添加定时器
 */
-(void)addTimer
{
    self.timer =  [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //多线程 UI IOS程序默认只有一个主线程，处理UI的只有主线程。如果拖动第二个UI，则第一个UI事件则会失效。
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}



/**
 *  关闭定时器
 */
-(void)closeTimer
{
    [self.timer invalidate];
}




#pragma mark - scrollView事件
/**
 *  scrollView 开始拖拽的时候调用
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self closeTimer];
}

/**
 * scrollView滚动的时候调用
 *
 *  @param scrollView <#scrollView description#>
 */
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    分页计算方法
    //    当前页=(scrollView.contentOffset.x+scrollView.frame.size.width/2)/scrollView.frame.size.width
    CGFloat page = (scrollView.contentOffset.x+scrollView.frame.size.width/2)/(scrollView.frame.size.width);
    self.pageControl.currentPage=page;
    
}

/**
 *  scrollView 结束拖拽的时候调用
 *
 *  @param scrollView <#scrollView description#>
 *  @param decelerate decelerate description
 */
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self addTimer];
}




#pragma mark - 懒加载
-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        
        //设置frame
        //240是图片高度
        CGFloat scrollW = self.view.frame.size.width;
        CGFloat scrollH = 240;
        CGFloat scrollX = 0;
        CGFloat scrollY = 0;
        _scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
        _scrollView.backgroundColor = [UIColor blackColor];
        
        //添加到view
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc]init];
        
        //设置frame
        CGFloat pageW = 100;
        CGFloat pageH = 10;
        CGFloat pageX = (self.view.frame.size.width-pageW)/2;
        CGFloat pageY = 240;
        _pageControl.frame =CGRectMake(pageX, pageY, pageW, pageH);
        
        //添加到view
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
}


-(int)imageTotal
{
    return 5;
}

@end

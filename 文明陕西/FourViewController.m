//
//  FourViewController.m
//  文明陕西
//
//  Created by dc004 on 15/12/15.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "FourViewController.h"
#import "MoreContent.h"
@interface FourViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collection;
    UILabel *_titleLable;
    
    UILabel *_codeLable;//二维码链接
    UILabel *_foodLable;//饮食举例
    UILabel *_cultuLable;//文化举例
    
    UIView *_greyView;//蒙版
    UIButton *_button;//加载在蒙版上
    NSArray *array;//接收图片
    UILabel *_lableText;
    
    UIImageView *_imageView;
    NSMutableArray *sixGod;
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置collectionView
    UICollectionViewFlowLayout *floeLayout = [[UICollectionViewFlowLayout alloc]init];
    _collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 150, 375, 560) collectionViewLayout:floeLayout];
    _collection.backgroundColor = [UIColor whiteColor];
    _collection.dataSource = self;
    _collection.delegate = self;
    [_collection registerClass:[MoreContent class] forCellWithReuseIdentifier:@"Cell"];
    [self.view addSubview:_collection];
    
    _titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 375, 30)];
    _titleLable.text = @"更多";
    _titleLable.textAlignment = NSTextAlignmentCenter;
    _titleLable.layer.borderColor = [UIColor grayColor].CGColor;
    _titleLable.layer.borderWidth = 2;
    [self.view addSubview:_titleLable];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(140, 60, 80, 80)];
    _imageView.image = [UIImage imageNamed:@"图"];
    [self.view addSubview:_imageView];
    
    _codeLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 100, 100)];
    _codeLable.text = @"友情链接";
    _codeLable.textColor = [UIColor redColor];
    
    _foodLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 220, 100, 100)];
    _foodLable.text = @"陕西美食";
    _foodLable.textColor = [UIColor redColor];
    
    _cultuLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 350, 100, 100)];
    _cultuLable.text = @"陕西文化";
    _cultuLable.textColor = [UIColor redColor];
    [self.view addSubview:_codeLable];
    [self.view addSubview:_foodLable];
    [self.view addSubview:_cultuLable];
}
//设置collectionVieCell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MoreContent *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"tu%ld",indexPath.row]];
    
    //添加图片点击事件
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageClike:)];
    cell.image.userInteractionEnabled = YES;
    cell.image.tag = indexPath.row;
    [cell.image addGestureRecognizer:tapGest];
    return cell;
}
-(void)imageClike:(UITapGestureRecognizer *)tapGestR{
    //蒙版设置
    _greyView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    _greyView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    sixGod = [NSMutableArray arrayWithCapacity:10];
    int m, n = 0;
    //第一行
    if (tapGestR.view.tag == 0 || tapGestR.view.tag == 1 || tapGestR.view.tag == 2) {
        n = 1;
        m = 1;
    }
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(18.75+i*118.75, 150+j*118.75, 330, 300)];
            if (tapGestR.view.tag == 0) {//第一格
                imageView.image = [UIImage imageNamed:@"tu0"];
                _lableText = [[UILabel alloc]initWithFrame:CGRectMake(90, 480, 240, 100)];
                _lableText.text = @"扫一扫，欢迎关注“文明陕西”!";
                _lableText.textColor = [UIColor redColor];
                [_greyView addSubview:_lableText];
                [_greyView addSubview:imageView];
                [sixGod addObject:imageView];
            }
            if (tapGestR.view.tag == 1) {//第二格
                imageView.image = [UIImage imageNamed:@"tu1"];
                _lableText = [[UILabel alloc]initWithFrame:CGRectMake(90, 480, 240, 100)];
                _lableText.text = @"扫一扫，欢迎关注“陕西网”!";
                _lableText.textColor = [UIColor redColor];
                [_greyView addSubview:_lableText];
                [_greyView addSubview:imageView];
                [sixGod addObject:imageView];
            }
            if (tapGestR.view.tag == 2) {//第三格
                imageView.image = [UIImage imageNamed:@"tu2"];
                _lableText = [[UILabel alloc]initWithFrame:CGRectMake(80, 480, 300, 100)];
                _lableText.text = @"扫一扫，欢迎关注“陕西文化网”!";
                _lableText.textColor = [UIColor redColor];
                [_greyView addSubview:_lableText];
                [_greyView addSubview:imageView];
                [sixGod addObject:imageView];
            }
        }
    }
    //第二行
    if (tapGestR.view.tag == 3 || tapGestR.view.tag == 4 || tapGestR.view.tag == 5) {
        n = 2;
        m = 3;
    }
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            UIImageView *imageViewI = [[UIImageView alloc]initWithFrame:CGRectMake(18.75+i*118.75, 150+j*118.75, 100, 100)];
            [_greyView addSubview:imageViewI];
            [sixGod addObject:imageViewI];
            if (tapGestR.view.tag == 3) {//第四格
                for (int x = 0; x < [sixGod count]; x++) {
                    UIImageView *imageViewI = (UIImageView *)sixGod[x];
                    imageViewI.image = [UIImage imageNamed:[NSString stringWithFormat:@"陕南%d",x]];
                    //标题头
                    UILabel *food = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 345, 100)];
                    food.text = @"陕南美食";
                    food.font = [UIFont boldSystemFontOfSize:30.0f];
                    food.textAlignment = NSTextAlignmentCenter;
                    //菜名
                    UILabel *foodName = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, 375, 20)];
                    foodName.text = @"        私房菜                   地铃菜               鸡黄米";
                    UILabel *foodNameI = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, 375, 20)];
                    foodNameI.text = @"        三丝菜                   油面               子阳蒸盆子";
                    UILabel *textlable = [[UILabel alloc]initWithFrame:CGRectMake(20, 390, 335, 220)];
                    textlable.text = @"陕南是指陕西南部地区，陕南地区从西往东依次的是汉中、安康、商洛三个地市。说起陕南小吃，安康蒸面是要排第一位的。“八大件”是安康酒席桌上一种菜肴组合的名称，就象清代皇宫举行盛大宴会时一定要来个“满汉全席”。安康人吃“八大件”有一个约定俗成的规矩，就是第一道热菜必上清蒸鸡皮粉，鸡肉要带皮，粉条一定要宽阔；第二道菜为糖醋鲤鱼。合起来寓意为“吉（鸡）庆有余（鱼）”，以图来年吉祥，其余菜肴按时令安排，按照一个带汤的蒸菜一个炒菜为序，上齐八个菜为标准。吃饭时，再上四个素菜作为下饭菜，一是清水绿豆芽，一是酸辣泡白菜，一是猪血豆腐干，再是木耳拌桃仁。炕炕馍，浆水面，菜豆腐，粉皮子，豆瓣鱼，米糕馍，麻辣鸡，柿饼，豆腐饺子，蒸雪糕，核桃馍。安康腊肉、魔芋豆腐、汉阴豆腐干、汉中凉皮、汉中菜豆腐粥、汉中米面皮、宁强王婆麻辣鸡、西乡牛肉干、汉阴炕炕馍";
                    textlable.font = [UIFont fontWithName:@"Arial" size:13];
                    textlable.numberOfLines = 30;
                    [_greyView addSubview:textlable];
                    [_greyView addSubview:foodNameI];
                    [_greyView addSubview:foodName];
                    [_greyView addSubview:food];
                }
            }
            if (tapGestR.view.tag == 4) {//第五格
                for (int y = 0; y < [sixGod count]; y++) {
                    UIImageView *imageViewI = (UIImageView *)sixGod[y];
                    imageViewI.image = [UIImage imageNamed:[NSString stringWithFormat:@"关中%d",y]];
                    UILabel *food = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 345, 100)];
                    food.backgroundColor = [UIColor redColor];
                    //标题头
                    UILabel *foodI = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 345, 100)];
                    foodI.text = @"关中美食";
                    foodI.font = [UIFont boldSystemFontOfSize:30.0f];
                    foodI.textAlignment = NSTextAlignmentCenter;
                    //菜名
                    UILabel *foodName = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, 375, 20)];
                    foodName.text = @"        裤带面                   擀面皮               四小碗";
                    UILabel *foodNameI = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, 375, 20)];
                    foodNameI.text = @"        油泼辣子面              荤五碗               臊子面";
                    UILabel *textlable = [[UILabel alloc]initWithFrame:CGRectMake(20, 390, 335, 220)];
                    textlable.text = @"牛羊肉泡馍，是独具西安方邦特色的著名小吃，西安老孙家饭庄从一八九八年开始经营，迄今已有百年历史。因多用荞麦面制成，比较固定的叫法是荞面饸饹。秦镇凉皮 以大米粉为原料制成，因产于户县的秦镇，也叫秦镇米皮。制作时把大米粉调节为糊状，平铺在多层竹蒸笼内，旺火蒸熟。吃时，用近一米长、20多厘米宽的大铡刀铡成细丝，加入辅料青菜、小豆芽等，调入佐料，好的口味全在辣椒油上，调好的凉皮全呈红色，辣里香。岐山面要求宽汤，即汤多面少，并突出酸辣味。所谓煎、汪即面条要热的烫嘴、油要多，才能体现此面的特色。岐山面是一种高碳水化合物、高饱和脂肪酸的地方特色面食。肉夹馍，由于其选料精、调味全、火功到，又经长时间煨制，颜色红润、软烂醇香、久贮不变。食者有”肥肉吃了不腻口，瘦肉无渣满口油，不用牙咬肉自烂，食后余香久不散“之赞誉。";
                    textlable.font = [UIFont fontWithName:@"Arial" size:13];
                    textlable.numberOfLines = 30;
                    [_greyView addSubview:textlable];
                    
                    [_greyView addSubview:foodNameI];
                    [_greyView addSubview:foodName];
                    [_greyView addSubview:foodI];
                }
            }
            if (tapGestR.view.tag == 5) {//第六格
                for (int z = 0; z < [sixGod count]; z++) {
                    UIImageView *imageViewI = (UIImageView *)sixGod[z];
                    imageViewI.image = [UIImage imageNamed:[NSString stringWithFormat:@"陕北%d",z]];
                    UILabel *food = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 345, 100)];
                    food.backgroundColor = [UIColor redColor];
                    UILabel *foodII = [[UILabel alloc]initWithFrame:CGRectMake(10, 20, 345, 100)];
                    foodII.text = @"陕北美食";
                    foodII.font = [UIFont boldSystemFontOfSize:30.0f];
                    foodII.textAlignment = NSTextAlignmentCenter;
                    //菜名
                    UILabel *foodName = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, 375, 20)];
                    foodName.text = @"        炸糕                   饼食               洋芋擦擦";
                    UILabel *foodNameI = [[UILabel alloc]initWithFrame:CGRectMake(0, 370, 375, 20)];
                    foodNameI.text = @"        炖肉                 凉拌牛肉                  糕点";
                    //介绍
                    UILabel *textlable = [[UILabel alloc]initWithFrame:CGRectMake(20, 390, 335, 220)];
                    textlable.text = @"钱钱饭这本是陕北缺粮人家的一种度荒饭，多和米糠、秕谷同煮，借以充饥。钱钱饭粘糊爽口，香浓味美，尤其是寒冬里，喝一碗钱钱饭驱寒保暖，惬意极了。卤煮驴板肠，是将整副驴大肠反复漂洗干净，入清水煮半熟，捞出加酱、辣椒、花椒、葱、姜、盐等卤煮而成，其特点是麻、辣、咸、嫩、鲜香味美，为陕北食中一奇。吃陕北菜时也别忘了要上一壶陕北米酒，这种用软黄米加工成的酒酸甜适口、消腻暖胃，是冬季佐餐的好饮料。黑楞楞，由土豆做成沫状，去处淀粉，然后做成圆球状，放入锅内蒸熟，陪上调料便可食用。虽然去处了淀粉在营养方面有一定的影响但是丝毫不能影响其令人难忘的味道。陕北大烩菜，陕北的最有特色的一道风味，虽然此菜源与内蒙，但是随着在陕北的落地生根加进去了许多陕北独特的风味，其主要有粉条、瘦肉、土豆、蔬菜等组成，味道鲜美，回味无穷。";
                    textlable.font = [UIFont fontWithName:@"Arial" size:13];
                    textlable.numberOfLines = 30;
                    [_greyView addSubview:textlable];
                    [_greyView addSubview:foodNameI];
                    [_greyView addSubview:foodName];
                    [_greyView addSubview:foodII];
                }
            }
        }
    }
    //第三行
    if (tapGestR.view.tag == 6 || tapGestR.view.tag == 7 || tapGestR.view.tag == 8) {
        n = 2;
        m = 3;
    }
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (tapGestR.view.tag == 6) {//第六格
                UIWebView *webView = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
                NSString *string = @"http://www.360doc.cn/article/1495057_31050628.html";
                NSURL *url = [NSURL URLWithString:string];
                [webView loadRequest:[NSURLRequest requestWithURL:url]];
                [_greyView addSubview:webView];
            }
            if (tapGestR.view.tag == 7) {//第七格
                UIWebView *webViewI = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
                NSString *stringI = @"http://sm.baike.com/item/f16dc1ee08da5ed8b2edef668387b97d.html?from=smsc&uc_param_str=dnntnwvepffrgibijbpr";
                NSURL *urlI = [NSURL URLWithString:stringI];
                [webViewI loadRequest:[NSURLRequest requestWithURL:urlI]];
                [_greyView addSubview:webViewI];
            }
            if (tapGestR.view.tag == 8) {//第八格
                UIWebView *webViewII = [[UIWebView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
                NSString *stringII = @"http://zm10.sm-img2.com/?src=http%3A%2F%2Ftravel.mangocity.com%2Fshanxi1%2Fshanxi1-feature.html&uid=fd7995e954d5e9b2dbbdc8acf2bd3d40&hid=c5288a3c84d7c3a44677f327ae74aaca&pos=8&cid=9&time=1450513199486&from=click&restype=1&pagetype=0000004000000402&bu=web&query=%E9%99%95%E8%A5%BF%E7%89%B9%E8%89%B2&mode=&uc_param_str=dnntnwvepffrgibijbprsvpi";
                NSURL *urlII = [NSURL URLWithString:stringII];
                [webViewII loadRequest:[NSURLRequest requestWithURL:urlII]];
                [_greyView addSubview:webViewII];
            }
        }
    }
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(355, 20, 20, 20)];
    _button.backgroundColor = [UIColor blackColor];
    [_button setTitle:@"X" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(GoOut) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_greyView];
    [_greyView addSubview:_button];
    NSLog(@"点击tu%ld",tapGestR.view.tag);
}
-(void)GoOut{
    [_greyView removeFromSuperview];
}
//设置cell大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(120,120);
}
//行距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//列距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
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

//
//  ThreeViewController.m
//  文明陕西
//
//  Created by dc004 on 15/12/15.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ThreeViewController.h"
#import "ClickCollectionViewCell.h"
@interface ThreeViewController ()
{
    UICollectionView *collection;
    NSArray *array;
    NSArray *arrayI;
}

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layout];
    array=@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    arrayI=@[
             @"第一怪 板凳不坐蹲起来典故一：《史记》中记载荆轲刺秦王，始皇帝就是席地而坐才无法拔剑，逃避中又忘记拔剑，只好绕拄周旋。典故二：东晋有个“身无长物”的典故，说的也是席地而坐的风俗。此风尚的转变应在晋以后，关中地区基本保持了“坐”的本意，只是姿势稍有改变，膝盖不着地了，大腿压在小腿肚子上，就变成为蹲姿，于是乎想蹲就蹲，此风尚也就世袭了下来。关中“蹲景”“蹲景”成为关中地区特别是农村最有名的亮点，这一怪独步天下，关中人的“蹲景”是地球上的绝版。有的人蹲半天腿不酸腰不痛，实属一种硬功夫。蹲是讲功夫的，只有长年累月的历练，才能长蹲而心静气闲，不累不乏。“蹲”的人已经很少了，但偶尔会在西安、咸阳等站牌前看见部分“蹲”下来等车的关中人。关中人把蹲叫圪蹴，历史可以追溯到遥远的春秋时期。关中人喜欢蹲是从古文的“坐”演变而来的。古人“坐”的本意就是跪，将膝盖并直端坐于席上，屁股的重量全压在双脚后跟上。",
             
             @" 房子半边盖传统的中国家居一般都是“人”字型结构，关中地区把这种房子叫“安间”房，又叫上房。里面住着主人和老人，结构都是厅房、两边是卧室。 一个院落除了上房还有偏房，在关中叫厦子房，房子的结构是“人”字的一半，就是半边盖的“怪”房子。为什么要把房子盖一半？首要因素就是贫穷。原来这种半边盖的房子都是土木结构，能节约大量的木材，实现了关中人少木多土的盖房理念。传统的关中院落进门有一道叫照壁的墙，往里左右都是厦子房，最里面是安间正房。关中有顺口溜“有钱住北房，避风又向阳。“房子半边盖”是关中一大景观，也是民生低下的产物，这种房子光线充足，就是通风不畅。农村都盖预制板的房子，建筑材料的革命改变了千年的习惯，半边盖的房子越来越少了。 一般人说“房子半边盖”是取肥水不外流之意，这种房檐水都滴进自家院落，可以解决缺水的问题。但是关中人不用窖水，也没收集雨水的风俗，这种说法只是附托之词，不足为信。（此说有误，关中缺水人尽皆知，为了缓解缺水的问题，关中人很多地区都是收集屋顶流下的雨水到窖里，需要的时候在用“楼楼”把水从窖里打起来存放在瓮里)。",
             
             @"第三怪姑娘不对外这一怪很多地区都有，只是在关中地区现象更突显，人情味也更浓郁。“两亩地一头牛，老婆孩子热炕头”是关中男人的写照，它的正面意思是关中男人恋家恋婆娘，在“玩龙玩虎不如玩黄土”的小农时代，这种思想也算正统。既然关中男人还不错，那么，这里的姑娘自然爱嫁当地郎了。配合这一观念的还有这里的地理优势，八百里秦川自古都是自给自足的宝地，风调雨顺，物产丰富，缺灾少害。所以，民殷实而安于现状，不思外出谋生。在关中地区，“金窝银窝不如自己的草窝”的观念长期占据主导地位，关中姑娘们生于此，当然不愿意远嫁他乡了。何况从地理位置讲，四边没有匹敌帝王州的地方。东面出潼关就要过黄河，那边的中原虽然好，但过去是三年一小灾，十年一大灾。河南的人都挑担子往关中逃荒，这样的地方能嫁吗？关中流传着“少不过潼关”的谚语；往西就是阳关了，西出阳关自古都是苦寒之地，前面有了王昭君哀怨千年的琵琶声咽，后面哪个瓜女子（傻姑娘，陕西地方语言。）",
             @"帕帕头上戴在关中风俗中这一怪最好解释了。过去人的生存环境差，黄土高原上风刮尘扬，烈日毒辣，妇女们出门干活串户没个遮蔽可不行，顶块手帕不能算怪吧？遮阳伞、防晒霜、口罩、墨镜是现代女性的生活必需品，过去的关中女人没这样的条件，她们生活中有一块整端漂亮的布做手帕就不错了。走亲戚，回门子（回娘家），下地干活时这个自制的手帕就发挥出大作用，年轻的妇女把手帕戴出许多花样来，成为风情和装饰。一般妇女是顶在头上遮阳挡风，下毛毛雨还能顶一阵子。关中妇女的手帕都很大，如果需要还能包裹东西当手袋用，别的用处都可以去想象，最重要的是不能弄脏头发。关中地区虽然号称“八水绕长安”，但地处西北总体缺水，过去没有洗澡设施，除了夏天别的季节都有问题。洗头也不方便，怕头上生虱子，于是，男人们都剃光瓢（光头），留长发的妇女就麻烦了，怕头弄脏了不好拾掇，只好用手帕把头包起来了。",
             @"面条像裤带关中独特的地理构造和自然环境使得关中地区成为一个以面食为主的地区，在以米菜为主的地方的人们总是想不通，那关中人天天吃面条没个花样换，怎么就吃不烦呢？ 其实，在关中，聪明灵巧的关中婆娘们已经把面食发展到一个很高的境界了。单是一个简单的面条，关中人做出的花样达几十种，棍棍面、片片面、凉面、臊子面、酸汤面、浆水面等等。说其像那裤带，说的是那面做的宽度和长度，在关中地区的面馆，一碗面只有一根面条，但若要让个弱女子能把这根面条吃完，那也是难事。 其中属棍棍面最长，臊子面最少，一碗饭只够吃一口，因此有得名：一口香。关中的男人娶媳妇，大多都是要看这女人的擀面手艺了。这做面条的功夫在那揉面的一关，没有揉到的面，见了开水马上就成了块状，再经水一煮，出来就是稀糊糊了。",
             @"锅盔像锅盖传说一：当年有场战争，战争的一方是新疆人，打到陕西的时候，干粮已经没了，只剩下些面粉，没有办法，就把那面粉和水和了，弄成饼状，放在那头盔里用火烙，做好后皮黄里香，而且持久耐放，随即传了开来，那打了胜仗回去后，兵士就让妇人照着做，但没有头盔，就在自家的锅里烙了，就有了锅盔这个名字，也就有了锅盔这个面食的花样了。传说二：相传唐代修乾陵时，因服役的军人工匠人数过多，往往为吃饭而耽误施工进度，受到惩罚。于是，有一士兵在焦急之中便把面团放进头盔里，把头盔放到火中去烤而烙成饼。",
             @"油泼辣子一道菜关中人对于辣子情有独钟，爱吃，而且和别的地方吃法不同，不吃干辣子面，而是油泼辣子。秦椒是很有名的，不但辣味十足，且具有独特的香味。油泼辣子做法很简单，也很有意思，同样是一样的辣子面，可家家的味道不同。常见的做法是辣子罐里的辣子面不能放满，六成即可，放点盐、胡椒或者别的，用原汁的菜籽油烫出来的味道最好，油温很有讲究，高了，辣子面会焦的，烫出来的味道就会发苦；低了，就没有辣子的香味，却是生油味，油温控制在八九成热，边倒边搅，直至油把辣子面埋没了就行了，这时候独特的香味会四处漂浮，满街都能闻见。当然，油泼辣子还有很多做法，而且每一道做法吃起来味道都不同，小小一碗油泼辣子奥妙无穷呀。",
             @"第八怪秦腔不唱吼起来这里的唱戏指的是秦腔表演。其实秦腔也不是真吼起来的，只不过演员表演起来确实很卖力气，开玩笑说是“叫破天”。夏天的时候，西安城墙周围会有很多自发的群众团体在那里唱秦腔，确实不需要扩音器之类的东西，老远就能听到，这种唱腔也许和关中人的语言特征有关，憨厚、耿直、调高。"
             
             
             ];

}
-(void)layout{
    UILabel * public=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 375, 40)];
    public.textColor=[UIColor blackColor];
    public.textAlignment=NSTextAlignmentCenter;
    public.font=[UIFont fontWithName:@"Arial" size:28];
    public.text=@"陕西公益";
    
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    
    collection=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 54, 375,570 )collectionViewLayout:flowlayout];
    
    collection.dataSource=self;
    collection.delegate=self;
    collection.backgroundColor= [UIColor whiteColor];
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //开启换页模式
    collection.pagingEnabled = YES;
    [self.view addSubview:collection];
    [self.view addSubview:public];
    [collection registerClass: [ClickCollectionViewCell class]forCellWithReuseIdentifier:@"Cell"];
}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ClickCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"SXBDG%@",array[indexPath.row]]];
    
    
    
    
    UITapGestureRecognizer *apGestureRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture:)];
    
    cell.imageView.userInteractionEnabled=YES;
    cell.imageView.tag=indexPath.row;
    [cell.imageView addGestureRecognizer:apGestureRecognizer];
    
    
    
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return array.count;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(375, 559);
}
//行间距为零
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
-(void)tapgesture:(UITapGestureRecognizer *)newTapgesture{
    _myView=[[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    UIImageView * image=[[UIImageView alloc]initWithFrame:CGRectMake(50, 60, 275, 230)];
    image.image=[UIImage imageNamed:[NSString stringWithFormat:@"SXBDG%@",array[newTapgesture.view.tag]]];
    _myView.backgroundColor = [UIColor whiteColor];
    //注意开启手势交互
    image.userInteractionEnabled = YES;
    [_myView addSubview:image];
    [self.view addSubview:_myView];
    _myView.userInteractionEnabled=YES;
    //取消按钮
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 375, 667)];
    [button addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [_myView addSubview:button];
    //介绍框
    UILabel * introduction=[[UILabel alloc]initWithFrame:CGRectMake(30, 300, 315, 260)];
    introduction.numberOfLines = 20;
    introduction.text=arrayI[newTapgesture.view.tag];
    introduction.font = [UIFont fontWithName:@"Arial" size:12];
    [button addSubview:introduction];
    //标题
    
    UILabel * detail=[[UILabel alloc]initWithFrame:CGRectMake(175, 25, 60, 20)];
    detail.font=[UIFont fontWithName:@"Arial" size:25];
    detail.textColor=[UIColor orangeColor];
    detail.text=@"介绍";
    [_myView addSubview:detail];
    
    
}
-(void)cancel{
    [_myView removeFromSuperview];
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

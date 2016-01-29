//
//  ClickCollectionViewCell.m
//  文明陕西
//
//  Created by dc004 on 15/12/17.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "ClickCollectionViewCell.h"

@implementation ClickCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"ClickCollectionViewCell" owner:nil options:nil];
    self=[array lastObject];
    [self layout];
    return self;
}
-(void)layout{
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake( 0, 0, 375,570)];
    [self addSubview:_imageView];
}

@end

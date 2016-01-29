//
//  MoreContent.m
//  文明陕西
//
//  Created by dc004 on 15/12/18.
//  Copyright © 2015年 gang. All rights reserved.
//

#import "MoreContent.h"

@implementation MoreContent
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"MoreContent" owner:nil options:nil];
    self = [array lastObject];
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

@end

//
//  HomeOnlyPicCollectionCell.m
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HomeOnlyPicCollectionCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeOnlyPicCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

- (UIImageView *)imageView
{
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor clearColor];
    }
    return _imageView;
}

- (void)setImageUrlString:(NSString *)imageUrl
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
}



@end

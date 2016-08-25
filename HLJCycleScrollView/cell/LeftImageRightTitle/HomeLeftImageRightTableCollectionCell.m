//
//  HomeLeftImageRightTableCollectionCell.m
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HomeLeftImageRightTableCollectionCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeLeftImageRightTableCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor redColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIImageView *)imageView
{
    if(!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat width = CGRectGetWidth(self.bounds);
    self.imageView.frame = CGRectMake(5, (height-18)/2, 30, 18);
    self.titleLabel.frame = CGRectMake(40, (height-16)/2, width-40, 16);
}

- (void)setWithItem:(ItemModel *)item
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:item.imageUrlString]];
    
    self.titleLabel.text = item.title;
}


@end

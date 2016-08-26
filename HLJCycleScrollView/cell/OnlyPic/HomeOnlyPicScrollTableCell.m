//
//  HomeOnlyPicScrollTableCell.m
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HomeOnlyPicScrollTableCell.h"
#import "HomeOnlyPicCollectionCell.h"

@implementation HomeOnlyPicScrollTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self.contentView addSubview:self.scrollView];
    }
    return self;
}

- (HLJCycleScrollView *)scrollView
{
    if(!_scrollView) {
        _scrollView = [HLJCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 200) delegate:self placeholderImage:nil];
    }
    return _scrollView;
}

- (void)setPicArray:(NSArray<NSString *> *)picArray
{
    if(_picArray == picArray) {
        return;
    }
    _picArray = picArray;
    
    [self.scrollView reloadScrollView];
}

- (NSString *)classNameForRegisterCollectionCellClass
{
    return NSStringFromClass([HomeOnlyPicCollectionCell class]);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _picArray.count;
}

- (void)fiflterCollectionCell:(UICollectionViewCell *)cell withCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexpath
{
    HomeOnlyPicCollectionCell *collectionCell = (HomeOnlyPicCollectionCell *)cell;
    
    NSString *str = _picArray[indexpath.item];
    
    [collectionCell setImageUrlString:str];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
}


@end

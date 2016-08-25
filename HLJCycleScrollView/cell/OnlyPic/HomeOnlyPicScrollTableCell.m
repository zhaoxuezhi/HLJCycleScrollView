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


- (NSArray<Class> *)registerCellClass;
{
    return @[
             [HomeOnlyPicCollectionCell class],
             ];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _picArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeOnlyPicCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeOnlyPicCollectionCell" forIndexPath:indexPath];
    
    NSInteger pageindex = indexPath.item % _picArray.count ;
    
    NSString *str = _picArray[pageindex];
    [cell setImageUrlString:str];
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
}


@end

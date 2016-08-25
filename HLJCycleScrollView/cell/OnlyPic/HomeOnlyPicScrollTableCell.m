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
    _pic1Array = nil;
    _pic2Array = nil;
    _pic3Array = nil;
    
    
    if(_picArray == picArray) {
        return;
    }
    _picArray = picArray;
    
    [self.scrollView reloadScrollView];
}

- (void)setPic1Array:(NSArray<NSString *> *)pic1Array
{
    _picArray = nil;
    _pic2Array = nil;
    _pic3Array = nil;
    
    if(_pic1Array == pic1Array) {
        return;
    }
    _pic1Array = pic1Array;
    
    [self.scrollView reloadScrollView];
}


- (void)setPic2Array:(NSArray<NSString *> *)pic2Array
{
    _pic1Array = nil;
    _picArray = nil;
    _pic3Array = nil;
    
    
    if(_pic2Array == pic2Array) {
        return;
    }
    _pic2Array = pic2Array;
    
    [self.scrollView reloadScrollView];
}


- (void)setPic3Array:(NSArray<NSString *> *)pic3Array
{
    _pic1Array = nil;
    _pic2Array = nil;
    _picArray = nil;
    
    if(_pic3Array == pic3Array) {
        return;
    }
    _pic3Array = pic3Array;
    
    [self.scrollView reloadScrollView];
}


- (NSArray<NSString *> *)currentArray
{
    if(_picArray) {
        return _picArray;
    }
    
    if(_pic1Array) {
        return _pic1Array;
    }
    
    if(_pic2Array) {
        return _pic2Array;
    }
    
    if(_pic3Array) {
        return _pic3Array;
    }
    return [NSArray array];
}


- (NSArray<Class> *)registerCellClass;
{
    return @[
             [HomeOnlyPicCollectionCell class],
             ];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self currentArray].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeOnlyPicCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeOnlyPicCollectionCell" forIndexPath:indexPath];
    
    NSArray *array = [self currentArray];
    NSInteger pageindex = indexPath.item % array.count ;
    
    NSString *str = [self currentArray][pageindex];
    [cell setImageUrlString:str];
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
}


@end

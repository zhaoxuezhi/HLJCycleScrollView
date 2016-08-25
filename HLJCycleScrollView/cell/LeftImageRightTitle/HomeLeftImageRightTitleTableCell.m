//
//  HomeLeftImageRightTitleTableCell.m
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "HomeLeftImageRightTitleTableCell.h"
#import "HomeLeftImageRightTableCollectionCell.h"


@implementation HomeLeftImageRightTitleTableCell

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
        _scrollView = [HLJCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 30) delegate:self placeholderImage:nil];
        _scrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _scrollView.showPageControl = NO;
    }
    return _scrollView;
}


- (NSArray<Class> *)registerCellClass;
{
    return @[
             [HomeLeftImageRightTableCollectionCell class],
             ];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _itemArray.count;
}

/**
 *    ⚠️ 这里的 dequeueReusableCellWithReuseIdentifier 必须为 CollectionCell 类名
 *    ⚠️ 取出元素下标一定要用 indexPath.item % cell个数， 
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeLeftImageRightTableCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeLeftImageRightTableCollectionCell" forIndexPath:indexPath];
    
    NSInteger pageindex = indexPath.item % self.itemArray.count ;
    
    ItemModel *model = _itemArray[pageindex];
    [cell setWithItem:model];
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
}

- (void)setItemArray:(NSArray<ItemModel *> *)itemArray
{
    if(_itemArray == itemArray) {
        return;
    }
    _itemArray = itemArray;
    
    [self.scrollView reloadScrollView];
}


@end

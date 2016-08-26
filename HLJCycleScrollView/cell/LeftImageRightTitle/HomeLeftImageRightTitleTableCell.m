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
        _scrollView.scrollEnabled = NO;
    }
    return _scrollView;
}


- (NSString *)classNameForRegisterCollectionCellClass
{
    return NSStringFromClass([HomeLeftImageRightTableCollectionCell class]);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _itemArray.count;
}

- (void)fiflterCollectionCell:(UICollectionViewCell *)cell withCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexpath
{
    HomeLeftImageRightTableCollectionCell *CollectionCell = (HomeLeftImageRightTableCollectionCell *)cell;
    
    ItemModel *model = _itemArray[indexpath.item];
    
    [CollectionCell setWithItem:model];
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

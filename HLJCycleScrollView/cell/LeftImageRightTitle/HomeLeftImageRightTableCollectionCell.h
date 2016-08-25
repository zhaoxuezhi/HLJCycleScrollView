//
//  HomeLeftImageRightTableCollectionCell.h
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

@interface HomeLeftImageRightTableCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *imageView;

- (void)setWithItem:(ItemModel *)item;

@end

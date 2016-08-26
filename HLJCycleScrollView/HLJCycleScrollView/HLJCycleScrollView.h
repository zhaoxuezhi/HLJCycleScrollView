//
//  HLJCycleScrollView.h
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/23.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HLJCycleScrollView;

typedef enum {
    
    HLJCycleScrollViewPageContolAliment_Right,
    HLJCycleScrollViewPageContolAliment_Center
    
} HLJCycleScrollViewPageContolAliment;


typedef void(^ClickItemOperationBlock)(NSInteger currentIndex);
typedef void(^ItemDidScrollOperationBlock)(NSInteger currentIndex);


@protocol HLJCycleScrollViewDelegate <NSObject>

@required

// 配置有多少个 item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

// 返回注册 collctionView 的 cell 类名
- (NSString *)classNameForRegisterCollectionCellClass;

// 配置每个cell
- (void)fiflterCollectionCell:(UICollectionViewCell *)cell withCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexpath;

@optional

/** 点击图片回调 */
- (void)cycleScrollView:(HLJCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index;

/** 图片滚动回调 */
- (void)cycleScrollView:(HLJCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index;

@end


@interface HLJCycleScrollView : UIView

/**
 *  pageControl 显示的对其方式
 */
@property (nonatomic, assign) HLJCycleScrollViewPageContolAliment pageControlAliment;

/**
 *  是否显示pageContrl
 */
@property (nonatomic, assign) BOOL showPageControl;

/**
 *  是否可滚动
 */
@property (nonatomic, assign) BOOL scrollEnabled;

/**
 *  只有一张图时是否隐藏 pageContrl
 */
@property (nonatomic, assign) BOOL hidesForSinglePage;

/**
 *  设置代理
 */
@property (nonatomic, weak) id<HLJCycleScrollViewDelegate> delegate;

/**
 *   block方式监听点击
 */
@property (nonatomic, copy) ClickItemOperationBlock clickItemOperationBlock;

/**
 *   block方式监听滚动
 */
@property (nonatomic, copy) ItemDidScrollOperationBlock itemDidScrollOperationBlock;

/**
 *  设置图片的显示模式，默认为 UIViewContentModeScaleToFill
 */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;

/**
 *  设置缺省图
 */
@property (nonatomic, strong) UIImage *placeholderImage;

/*
 * 自动滚动间隔时间,默认2s
 */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/*
 * 是否无限循环,默认Yes
 */
@property (nonatomic,assign) BOOL infiniteLoop;

/*
 * 是否自动滚动,默认Yes
 */
@property (nonatomic,assign) BOOL autoScroll;

/*
 * 图片滚动方向，默认为水平滚动
 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;


/** 初始轮播图 */
+ (instancetype)cycleScrollViewWithFrame:(CGRect)frame delegate:(id<HLJCycleScrollViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

/**
 *  刷新数据
 */
- (void)reloadScrollView;

@end

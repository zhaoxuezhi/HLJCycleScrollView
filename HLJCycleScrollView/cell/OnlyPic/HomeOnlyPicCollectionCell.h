//
//  HomeOnlyPicCollectionCell.h
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeOnlyPicCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *imageView;

- (void)setImageUrlString:(NSString *)imageUrl;

@end

//
//  HomeOnlyPicScrollTableCell.h
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLJCycleScrollView.h"

@interface HomeOnlyPicScrollTableCell : UITableViewCell <HLJCycleScrollViewDelegate>

@property (nonatomic, strong) NSArray<NSString *> *picArray;

@property (nonatomic, strong) NSArray<NSString *> *pic1Array;

@property (nonatomic, strong) NSArray<NSString *> *pic2Array;

@property (nonatomic, strong) NSArray<NSString *> *pic3Array;


@property (nonatomic, strong) HLJCycleScrollView *scrollView;

@end

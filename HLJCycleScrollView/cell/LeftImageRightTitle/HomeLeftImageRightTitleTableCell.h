//
//  HomeLeftImageRightTitleTableCell.h
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/25.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HLJCycleScrollView.h"
#import "ItemModel.h"

@interface HomeLeftImageRightTitleTableCell : UITableViewCell <HLJCycleScrollViewDelegate>

@property (nonatomic, strong) HLJCycleScrollView *scrollView;

@property (nonatomic, strong) NSArray <ItemModel *>*itemArray;

@end

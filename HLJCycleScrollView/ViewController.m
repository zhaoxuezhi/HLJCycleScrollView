//
//  ViewController.m
//  HLJCycleScrollView
//
//  Created by xiezi on 16/8/23.
//  Copyright © 2016年 xiezi. All rights reserved.
//

#import "ViewController.h"

#import "HomeLeftImageRightTitleTableCell.h"
#import "HomeOnlyPicScrollTableCell.h"

#import "ItemModel.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) NSMutableArray *itemArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // 测试只显示图片的
    _dataSource = [[NSMutableArray alloc] init];
    
    NSArray *array1 =  @[
                @"http://f.hiphotos.baidu.com/image/h%3D200/sign=3630dd6c4336acaf46e091fc4cd88d03/bd3eb13533fa828b5bc103b6f51f4134960a5a81.jpg",
                @"http://img.tuku.cn/file_thumb/201403/m2014031115253312.jpg",
                @"http://imgst-dl.meilishuo.net/pic/_o/84/a4/a30be77c4ca62cd87156da202faf_1440_900.jpg"
                ];
    
    [self.dataSource addObject:array1];
    
    NSArray *array2 = @[
                        @"http://d05.res.meilishuo.net/pic/l/f0/da/60f12fb56faf727c9530984b6853_500_331.jpg",
                        @"http://img3.3lian.com/2013/v8/72/d/61.jpg",
                        @"http://image6.huangye88.com/2013/03/28/2a569ac6dbab1216.jpg",
                        ];
    [self.dataSource addObject:array2];

    NSArray *array3 = @[
                        @"http://img5.imgtn.bdimg.com/it/u=1898795798,2798655787&fm=206&gp=0.jpg",
                        ];
    [self.dataSource addObject:array3];

    
    NSArray *array4 = @[
                        @"http://img3.imgtn.bdimg.com/it/u=2434382235,3799675822&fm=206&gp=0.jpg",
                        @"http://pic38.nipic.com/20140306/2457331_150217053000_2.jpg",
                        ];
    [self.dataSource addObject:array4];

    [self.dataSource addObjectsFromArray:self.dataSource];
    
    
    // 测试显示 ： 左边图片右边文字的
    _itemArray = [NSMutableArray array];
    
    ItemModel *item = [[ItemModel alloc] init];
    item.title = @"wwedlwdklwdwldwldwldldedwldnlnvnklnve";
    item.imageUrlString = @"";
    [_itemArray addObject:item];
    
    ItemModel *item1 = [[ItemModel alloc] init];
    item1.title = @"wwedlwdklwdwldwldwldldedwldnlnvnklnve";
    item1.imageUrlString = @"";
    [_itemArray addObject:item1];
    
    [_itemArray addObjectsFromArray:_itemArray];
    
    [_itemArray addObjectsFromArray:_itemArray];
    
    [self.view addSubview:self.tableView];
    

    [self.tableView reloadData];
}

- (UITableView *)tableView
{
    if(!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

#pragma mark -- tableView 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0) {
        return _dataSource.count;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1) {
        NSString *cellkey = @"HomeLeftImageRightTitleTableCell";
        HomeLeftImageRightTitleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellkey];
        if(!cell) {
            cell = [[HomeLeftImageRightTitleTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellkey];
        }

        cell.itemArray = _itemArray;
        return cell;
    }
    
    NSString *cellkey = @"HomeOnlyPicScrollTableCell";
    HomeOnlyPicScrollTableCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellkey];
    if(!cell) {
        cell = [[HomeOnlyPicScrollTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellkey];
    }
    
    NSArray *array = _dataSource[indexPath.row];
    
    cell.picArray = array;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 1) {
        return 30;
    }
    
    if(indexPath.row %3 == 0) {
        return 200;
    } else if(indexPath.row %3 == 1) {
        return 150;
    }
    return 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHWalletController.h"
#import "SHCalViewController.h"
#import "TouchIDManager.h"
#import "SHItem.h"
#import "SHFormView.h"
#import "SHItemModel.h"
@interface ViewController ()<SHItemDelegate,SHFormViewDelegate>
@property(strong,nonatomic) SHFormView *tableListView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupItemView];

    
//    _tableListView = [[SHFormView alloc] initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width, 400)];
//    _tableListView.originPointModel = [SHFormModel creatFormModelTitle:@"经营指标"];
//    _tableListView.X_AxisSource = [SHFormConfig creatX_Axis];
//    _tableListView.Y_AxisSource = [SHFormConfig creatY_Axis];
//    _tableListView.formDataSource = [SHFormConfig creatFormDataSource];
//    _tableListView.delegate = self;//设置代理作用:选中某一个 可自行修改
//    [self.view addSubview:_tableListView];
}
- (void)successOfCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击第%ld行 第%ld个",indexPath.section,indexPath.row);
}

- (void)setupItemView {
    for (NSInteger index = 0; index < self.dataSource.count; index ++) {
        CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width * 0.25;
        SHItem *walletItem = [[SHItem alloc] initWithFrame:CGRectMake(index * itemWidth + 20, 100, itemWidth, itemWidth*2)];
        walletItem.itemModel = _dataSource[index];
        walletItem.delegate = self;
        [self.view addSubview:walletItem];
    }
}

- (void)itemDidSelect:(SHItemModel *)itemModel {
    if (itemModel.ID == 1) {
        [self.navigationController pushViewController:[[SHWalletController alloc] init] animated:YES];
    }
    if (itemModel.ID == 2) {
        [self.navigationController pushViewController:[[SHCalViewController alloc] init] animated:YES];
    }
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        NSMutableArray *mu = [NSMutableArray array];
        [mu addObject:[SHItemModel creatModelWithImage:@"sh_wallet" Title:@"卡包" ID:1]];
        [mu addObject:[SHItemModel creatModelWithImage:@"sh_wallet" Title:@"计算器" ID:2]];
        _dataSource = mu;
    }
    return _dataSource;
}
@end

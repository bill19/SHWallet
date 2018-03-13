//
//  ViewController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHWalletController.h"
#import "TouchIDManager.h"
#import "SHItem.h"
#import "SHFormView.h"
@interface ViewController ()<SHItemDelegate,SHFormViewDelegate>
@property(strong,nonatomic) SHFormView *tableListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupItemView];

    _tableListView = [[SHFormView alloc] initWithFrame:CGRectMake(0, 100,[UIScreen mainScreen].bounds.size.width, 400) X_Axis:[SHFormConfig creatX_Axis] Y_Axis:[SHFormConfig creatY_Axis] Origin:[SHFormConfig creatOriginPoint]];

    _tableListView.formDataSource = [SHFormConfig creatFormDataSource];
    _tableListView.delegate = self;//设置代理作用:选中某一个 可自行修改
    [self.view addSubview:_tableListView];
}
- (void)successOfCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击第%ld行 第%ld个",indexPath.section,indexPath.row);
}

- (void)setupItemView {
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width * 0.25;
    SHItem *walletItem = [[SHItem alloc] initWithFrame:CGRectMake(0, 100, itemWidth, itemWidth*2)];
    walletItem.itemModel = [SHItemModel creatModelWithImage:@"sh_wallet" Title:@"卡包"];
    walletItem.delegate = self;
    [self.view addSubview:walletItem];
}

- (void)itemDidSelect:(SHItemModel *)itemModel {

    if ([TouchIDManager sharedManager].canUseTouchId) {
        [[TouchIDManager sharedManager] touchIDWithlocalizedFallbackTitle:@"验证" localizedReason:@"指纹验证" success:^(BOOL success, NSError *error) {
            [self.navigationController pushViewController:[[SHWalletController alloc] init] animated:YES];
        }];
    }else{
        [self.navigationController pushViewController:[[SHWalletController alloc] init] animated:YES];
    }
}
@end

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
#import "MyTableListView.h"
@interface ViewController ()<SHItemDelegate,MyTableListViewDelegate>
@property(strong,nonatomic) MyTableListView *tableListView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"功能首页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupItemView];

    //修改表格显示内容标题 只需要在SHFormConfig文件中修改属性以及其他
    //调整第一列的宽度 可在MyTableListView.m中最上面修改 FIRSTCELLWIDTH
    //调整每一行的高度 可在MyTableListView.m中最上面修改 ALLCELLHIGH
    //调整第一列后的宽度 可在MyTableListView.m中最上面修改 OTHERCELLWIDTH
    //点击下面按钮 可增加一行显示在最上面 如有需要可自行 调整更新以及添加代理等
    //若有其他调整 可自调
    _tableListView = [[MyTableListView alloc] initWithFrame:CGRectMake(0, 100,400, 400)];
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

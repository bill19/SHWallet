//
//  ViewController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHItem.h"
@interface ViewController ()<SHItemDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItemView];
}

- (void)setupItemView {
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width * 0.25;
    SHItem *walletItem = [[SHItem alloc] initWithFrame:CGRectMake(0, 100, itemWidth, itemWidth*2)];
    walletItem.itemModel = [SHItemModel creatModelWithImage:@"sh_wallet" Title:@"卡包"];
    [self.view addSubview:walletItem];
}

- (void)itemDidSelect:(SHItemModel *)itemModel {

    
}
@end

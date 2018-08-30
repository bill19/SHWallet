//
//  SHItemBanner.m
//  SHWallet
//
//  Created by sunhao on 2018/8/30.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItemBanner.h"
#import "SHItemModel.h"
#import "SHItemBannerConfig.h"
#import "SHItem.h"
@interface SHItemBanner ()
@property (nonatomic, strong) UIScrollView *scrollView;

/**
 配置信息
 */
@property (nonatomic, strong) SHItemBannerConfig *config;
/**
 item 数据源
 */
@property (nonatomic, strong) NSArray <SHItemModel *> *items;
@end

@implementation SHItemBanner

#pragma mark - 创建方法 init

- (instancetype)initWithItems:(NSArray <SHItemModel *>*)items config:(SHItemBannerConfig *)config {
    self = [super initWithFrame:CGRectZero];

    if (self) {
        self.config = config;
        self.items  = items;
        [self setupSubViews];
    }

    return self;
}


#pragma mark - UISetup
- (void)setupSubViews {
    // 1.创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    self.scrollView = scrollView;

}


- (void)updateFrame{

    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / self.config.onePageLine;
    if (self.config.style == SHItemBannerPaved) {

        for (int i = 0; i < self.items.count; i++) {
            SHItem *imageView = [[SHItem alloc] init];
            NSInteger row = i / self.config.onePageLine;
            NSInteger col = i % self.config.onePageLine;
            CGFloat picX = itemWidth * col;
            CGFloat picY = itemWidth * 2 * row;
            imageView.frame = CGRectMake(picX, picY, itemWidth, itemWidth * 2);
            [self.scrollView addSubview:imageView];
        }

    }

    if (self.config.style == SHItemBannerScroll) {

    }

}

- (void)setItems:(NSArray<SHItemModel *> *)items {
    if (items == _items) {
        return;
    }
    _items = items;
}

- (void)setConfig:(SHItemBannerConfig *)config {
    if (config == _config) {
        return;
    }
    _config = config;
}

- (void)updateItems:(NSArray <SHItemModel *>*)items {
    if (items == _items) {
        return;
    }
    self.items = items;
}

@end

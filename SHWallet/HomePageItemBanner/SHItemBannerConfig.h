//
//  SHItemBannerConfig.h
//  SHWallet
//
//  Created by sunhao on 2018/8/30.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SHItemBannerPaved = 1,
    SHItemBannerScroll = 2
} SHItemBannerStyle;

@interface SHItemBannerConfig : NSObject

/**
 展示样式 - 是横向滚动还是直接 竖直平铺
 */
@property (nonatomic, assign) SHItemBannerStyle style;

/**
 是否展示pageController - 只对横向滚动有用
 */
@property (nonatomic, assign) BOOL showPage;

/**
 一行多少个Item
 */
@property (nonatomic, assign) NSInteger onePageLine;

/**
 一页page有几行 只对横向滚动有用
 */
@property (nonatomic, assign) NSInteger onePageRow;
@end

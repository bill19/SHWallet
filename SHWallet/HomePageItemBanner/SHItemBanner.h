//
//  SHItemBanner.h
//  SHWallet
//
//  Created by sunhao on 2018/8/30.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHItemModel;
@class SHItemBannerConfig;
@interface SHItemBanner : UIView
- (id)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithItems:(NSArray <SHItemModel *>*)items config:(SHItemBannerConfig *)config NS_DESIGNATED_INITIALIZER;

/**
 数据源信息
 */
- (void)updateItems:(NSArray <SHItemModel *>*)items;

@end

//
//  SHItem.h
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+RefreshLocation.h"
#import "SHItemModel.h"
@protocol SHItemDelegate <NSObject>
@optional
- (void)itemDidSelect:(SHItemModel *)itemModel ;

@end


@interface SHItem : UIView
@property (nonatomic, assign) id <SHItemDelegate> delegate;
@property (nonatomic, strong) SHItemModel *itemModel;
@end

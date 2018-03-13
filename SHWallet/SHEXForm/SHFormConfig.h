//
//  SHFormConfig.h
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SHFormModel.h"
static CGFloat const kFirstCellWidth   = 100.0f;
static CGFloat const kNormalCellWidth  = 80.0f;
static CGFloat const kNormalCellHeight = 40.0f;

static NSString *const kHeaderIdentifier = @"kFormCollectionHeader";
static NSString *const kFooterIdentifier = @"kFormCollectionFooter";
@interface SHFormConfig : NSObject

/**
 创建UICollectionView 布局

 @return 默认布局
 */
+ (UICollectionViewFlowLayout *)creatFormNormalLayout;

/**
 创建X轴 数组信息

 @return X轴
 */
+ (NSArray <SHFormModel *>*)creatX_Axis ;

/**
 创建Y轴 数组信息

 @return Y轴
 */
+ (NSArray <SHFormModel *>*)creatY_Axis ;

+ (NSArray *)creatFormDataSource ;

@end

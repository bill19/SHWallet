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
 创建标题头样式 原点

 @return 返回 创建标题头样式
 */
+ (UILabel *)creatFormTitleLabel;

/**
 创建内容样式 Title信息

 @return 返回 创建内容样式
 */
+ (UILabel *)creatFormNormalLabel ;

/**
 创建标题样式 Title信息  最上面那一行样式

 @return 返回 最上面那一行样式
 */
+ (UILabel *)creatFormUpTitleLabel ;

/**
 创建标题样式 Title信息  最左边面那一行样式

 @return 返回 最左边面那一行样式
 */
+ (UILabel *)creatFormLeftTitleLabel ;

/**
 原点信息

 @return 原点信息
 */
+ (NSString *)creatOriginPoint ;

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

//
//  SHFormView.h
//  xxxxxxxx
//
//  Created by WF on 2017/1/14.
//  Copyright © 2017年 WF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHFormConfig.h"
#import "SHFormModel.h"
@protocol SHFormViewDelegate <NSObject>
@optional
/**
 点击某个按钮展示信息

 @param collectionView collectionView
 @param indexPath indexPath
 */
- (void)successOfCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface SHFormView : UIView

@property (nonatomic, weak) id <SHFormViewDelegate> delegate;

/**
 原点展示信息
 */
@property (nonatomic, strong) SHFormModel *originPointModel;
/**
 X轴上的信息数据
 */
@property (nonatomic, strong) NSArray <SHFormModel *>*X_AxisSource;
/**
 Y轴上的信息数据
 */
@property (nonatomic, strong) NSArray <SHFormModel *>*Y_AxisSource;

/**
 更新数据信息
 */
@property (nonatomic, strong) NSArray <NSArray <SHFormModel *>*>*formDataSource;
@end

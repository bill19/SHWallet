//
//  MyTableListView.h
//  xxxxxxxx
//
//  Created by WF on 2017/1/14.
//  Copyright © 2017年 WF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHFormConfig.h"
#import "SHFormModel.h"
@protocol MyTableListViewDelegate <NSObject>
@optional
/**
 点击某个按钮展示信息

 @param collectionView collectionView
 @param indexPath indexPath
 */
- (void)successOfCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyTableListView : UIView
/***MyTableListViewDelegate代理事件*/
@property (nonatomic, weak) id <MyTableListViewDelegate> delegate;

/**数据表格的标题数据*/
@property (nonatomic, strong) NSArray <SHFormModel *>*formTitleSource;

/**数据表格的列表标题数据*/
@property (nonatomic, strong) NSArray <SHFormModel *>*formLitsSource;

/**数据表格的内容数据*/
@property(strong,nonatomic) NSArray<SHFormModel *>*formSource;

@end

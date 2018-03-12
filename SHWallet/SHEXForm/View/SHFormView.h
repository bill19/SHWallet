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
/***SHFormViewDelegate代理事件*/
@property (nonatomic, weak) id <SHFormViewDelegate> delegate;

@end

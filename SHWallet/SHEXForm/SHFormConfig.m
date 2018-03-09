//
//  SHFormConfig.m
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import "SHFormConfig.h"
@implementation SHFormConfig

/**
 创建UICollectionView 布局

 @return 默认布局
 */
+ (UICollectionViewFlowLayout *)creatFormNormalLayout {
    //左下布局
    UICollectionViewFlowLayout *formLayout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    // 定义大小
    formLayout.itemSize = CGSizeMake(kNormalCellWidth, kNormalCellHeight);
    // 设置最小行间距
    formLayout.minimumLineSpacing = 0;
    // 设置垂直间距
    formLayout.minimumInteritemSpacing = 0;
    // 设置滚动方向（默认垂直滚动）
    formLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return formLayout;
}

/**
 创建标题头样式 原点

 @return 返回 创建标题头样式
 */
+ (UILabel *)creatFormTitleLabel {
    UILabel * originLabel = [[UILabel alloc] init];
    originLabel.layer.borderColor = [UIColor blackColor].CGColor;
    originLabel.backgroundColor = [UIColor redColor];
    originLabel.layer.borderWidth = 1.f;
    originLabel.textAlignment = NSTextAlignmentCenter;
    originLabel.font = [UIFont systemFontOfSize:17.f];
    originLabel.text = @"原点";
    return originLabel;
}

/**
 创建内容样式 Title信息

 @return 返回 创建内容样式
 */
+ (UILabel *)creatFormNormalLabel {
    UILabel * normalLabel = [[UILabel alloc] init];
    normalLabel.layer.borderColor = [UIColor blackColor].CGColor;
    normalLabel.backgroundColor = [UIColor yellowColor];
    normalLabel.layer.borderWidth = 1.f;
    normalLabel.textAlignment = NSTextAlignmentCenter;
    normalLabel.font = [UIFont systemFontOfSize:17.f];
    return normalLabel;
}

@end

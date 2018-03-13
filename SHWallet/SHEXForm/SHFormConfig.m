//
//  SHFormConfig.m
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import "SHFormConfig.h"
#import "UIColor+KNColor.h"
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
    originLabel.layer.borderColor = [UIColor colorWithHexString:@"#DDDDDD"].CGColor;
    originLabel.backgroundColor = [UIColor redColor];
    originLabel.layer.borderWidth = .3f;
    originLabel.textAlignment = NSTextAlignmentCenter;
    originLabel.font = [UIFont systemFontOfSize:14.f];
    originLabel.text = @"经营指数";
    return originLabel;
}

/**
 创建内容样式 Title信息

 @return 返回 创建内容样式
 */
+ (UILabel *)creatFormNormalLabel {
    UILabel * normalLabel = [[UILabel alloc] init];
    normalLabel.layer.borderColor = [UIColor colorWithHexString:@"#DDDDDD"].CGColor;
    normalLabel.backgroundColor = [UIColor yellowColor];
    normalLabel.layer.borderWidth = .3f;
    normalLabel.textAlignment = NSTextAlignmentCenter;
    normalLabel.font = [UIFont systemFontOfSize:14.f];
    return normalLabel;
}

/**
 创建标题样式 Title信息  最上面那一行样式

 @return 返回 最上面那一行样式
 */
+ (UILabel *)creatFormUpTitleLabel {
    UILabel * normalLabel = [[UILabel alloc] init];
    normalLabel.layer.borderColor = [UIColor colorWithHexString:@"#DDDDDD"].CGColor;
    normalLabel.backgroundColor = [UIColor yellowColor];
    normalLabel.layer.borderWidth = .3f;
    normalLabel.textAlignment = NSTextAlignmentCenter;
    normalLabel.font = [UIFont systemFontOfSize:14.f];
    return normalLabel;
}

/**
 创建标题样式 Title信息  最左边面那一行样式

 @return 返回 最左边面那一行样式
 */
+ (UILabel *)creatFormLeftTitleLabel {
    UILabel * normalLabel = [[UILabel alloc] init];
    normalLabel.layer.borderColor = [UIColor colorWithHexString:@"#DDDDDD"].CGColor;
    normalLabel.backgroundColor = [UIColor yellowColor];
    normalLabel.layer.borderWidth = .3f;
    normalLabel.textAlignment = NSTextAlignmentCenter;
    normalLabel.font = [UIFont systemFontOfSize:14.f];
    return normalLabel;
}

/**
 创建表格上表信息

 @return 上表信息数值
 */
+ (NSArray *)creatFormNormalTitles {
    return @[@"经营指数",@"本期数",@"上期数",@"环比"];
}

@end

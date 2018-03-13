//
//  SHFormModel.h
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHFormModel : NSObject

/**
 参数名称
 */
@property (nonatomic, copy) NSString *attributeName;

/**
 单元格按钮颜色
 */
@property (nonatomic, strong) UIColor *formBgColor;

/**
 边框颜色
 */
@property (nonatomic, strong) UIColor *formBordeColor;

/**
 边框粗度
 */
@property (nonatomic, assign) CGFloat formBordeWidth;

/**
 字体大小
 */
@property (nonatomic, assign) CGFloat formFontSize;

+ (SHFormModel *)creatFormModelTitle:(NSString *)title ;
+ (NSArray <SHFormModel *>*)creatFormModelWithSource:(NSArray <NSString *>*)source ;
@end

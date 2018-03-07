//
//  SHItemModel.h
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHItemModel : NSObject
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;

+ (SHItemModel *)creatModelWithImage:(NSString *)image Title:(NSString *)title;

@end

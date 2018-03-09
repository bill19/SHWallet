//
//  SHFormModel.h
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHFormModel : NSObject

@property (nonatomic, copy) NSString *attributeName;

+ (SHFormModel *)creatFormModel ;
@end

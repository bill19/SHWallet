//
//  SHFormModel.m
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import "SHFormModel.h"

@implementation SHFormModel

+ (SHFormModel *)creatFormModel  {
    
    SHFormModel * model = [[SHFormModel alloc] init];
    model.attributeName = @"2+x";
    return model;
}
@end

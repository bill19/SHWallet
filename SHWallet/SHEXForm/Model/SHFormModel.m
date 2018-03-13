//
//  SHFormModel.m
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import "SHFormModel.h"

@implementation SHFormModel

+ (SHFormModel *)creatFormModel {
    SHFormModel * model = [[SHFormModel alloc] init];
    model.attributeName = @"2+x";
    return model;
}
+ (SHFormModel *)creatFormModelTitle:(NSString *)title {
    SHFormModel * model = [[SHFormModel alloc] init];
    model.attributeName = title;
    return model;
}

+ (NSArray <SHFormModel *>*)creatFormModelWithSource:(NSArray <NSString *>*)source  {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < source.count; index++) {
        SHFormModel * model = [[SHFormModel alloc] init];
        model.attributeName = [source objectAtIndex:index];
        [mu addObject:model];
    }
    return mu;
}
@end

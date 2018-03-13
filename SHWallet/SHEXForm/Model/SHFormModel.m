//
//  SHFormModel.m
//  表格（简易）
//
//  Created by HaoSun on 2018/3/9.
//  Copyright © 2018年 WF. All rights reserved.
//

#import "SHFormModel.h"
#import "UIColor+KNColor.h"
@implementation SHFormModel

+ (SHFormModel *)creatFormModelTitle:(NSString *)title {
    SHFormModel * model = [[SHFormModel alloc] init];
    model.attributeName = title;
    model.formBordeColor = [UIColor yellowColor];
    model.formBgColor = [UIColor redColor];
    model.formBordeWidth = .3f;
    model.formFontSize = 14.f;
    return model;
}

+ (NSArray <SHFormModel *>*)creatFormModelWithSource:(NSArray <NSString *>*)source  {
    NSMutableArray *mu = [NSMutableArray array];
    for (NSInteger index = 0; index < source.count; index++) {
        [mu addObject:[SHFormModel creatFormModelTitle:[source objectAtIndex:index]]];
    }
    return mu;
}
@end

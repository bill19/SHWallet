//
//  SHItemModel.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItemModel.h"

@implementation SHItemModel

+ (SHItemModel *)creatModelWithImage:(NSString *)image Title:(NSString *)title ID:(NSInteger)ID;{
    SHItemModel *model = [[SHItemModel alloc] init];
    model.image = image;
    model.title = title;
    model.ID = ID;
    return model;
}

@end

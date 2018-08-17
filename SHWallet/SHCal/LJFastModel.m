//
//  LJFastModel.m
//  Cal
//
//  Created by sunhao on 2018/8/13.
//  Copyright © 2018年 sunhao. All rights reserved.
//

#import "LJFastModel.h"

@interface LJFastModel ()

@end

@implementation LJFastModel

+ (NSArray <LJFastModel *>*)getLJFastModels {
    NSMutableArray *mu = [NSMutableArray array];

    NSArray *maxSource = @[@1500,@4500,@9000,@35000,@55000,@80000,@100000000];
    NSArray *minSource = @[@0,@1500,@4500,@9000,@35000,@55000,@80000];
    NSArray *taxSource = @[@0.03,@0.1,@0.2,@0.25,@0.3,@0.35,@0.45];
    NSArray *fastMSource = @[@0,@105,@555,@1005,@2755,@5505,@13505];
    for (NSInteger index = 0; index < 7; index ++) {
        LJFastModel *model = [LJFastModel new];
        model.maxM = maxSource[index];
        model.minM = minSource[index];
        model.tax = taxSource[index];
        model.fastM = fastMSource[index];
        [mu addObject:model];
    }
    return mu;
}

@end

//
//  LJFastModel.h
//  Cal
//
//  Created by sunhao on 2018/8/13.
//  Copyright © 2018年 sunhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LJFastModel : NSObject
@property (nonatomic, strong) NSNumber *tax;
@property (nonatomic, strong) NSNumber *fastM;
@property (nonatomic, strong) NSNumber *maxM;
@property (nonatomic, strong) NSNumber *minM;

+ (NSArray <LJFastModel *>*)getLJFastModels;
@end


//
//  ViewController.m
//  Cal
//
//  Created by sunhao on 2018/8/13.
//  Copyright © 2018年 sunhao. All rights reserved.
//

#import "SHCalViewController.h"
#import "LJFastModel.h"
#import "LJCalView.h"
@interface SHCalViewController ()
@property (nonatomic, strong) NSArray <LJFastModel *>*fastBuckleTable;
@property (nonatomic, strong) LJCalView *calView;
@end

@implementation SHCalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.calView];
    __weak __typeof(self) weakSelf = self;
    self.calView.calclick = ^(NSString *text) {
        weakSelf.calView.showLabel.text = [weakSelf calMaxWithRMB:[text floatValue]];
    };
}

- (LJCalView *)calView {
    if (!_calView) {
        _calView = [[LJCalView alloc] initWithFrame:CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width, 500)];
    }
    return _calView;
}

//扣除五险一金啥的之后 从3500开始写
- (NSString *)calMaxWithRMB:(NSInteger)myRMB {
    CGFloat tempMax = 0;//一年一共得到多少钱
    CGFloat tempsumTax = 0;//一年一共扣多少税
    CGFloat needRMB = 0;//实际一个月领取多少钱 最合适
    CGFloat saveRMB = 0;//节省了多少钱呢
    CGFloat yearLastRMB = 0;//年终奖多少钱
    CGFloat mymon = 0;//本月扣税
    CGFloat myye = 0;//年终奖扣税
    CGFloat xRmb = 0;//本月扣完税的金额s
    CGFloat xTax = (myRMB - [self getCalWithRMB:myRMB] )* 12;//一年扣税
    for (NSInteger index = 3500; index <= myRMB; index ++) {
        CGFloat mon = [self getCalWithRMB:index];//本月扣税
        CGFloat ye  = [self getyearCalWithRMB:(myRMB - index)];//年终奖扣税
        CGFloat sumTax = mon * 12 + ye;
        CGFloat getRMB = myRMB * 12 - sumTax;
        if (tempMax < getRMB) {
            tempMax = getRMB;
            tempsumTax = sumTax;
            needRMB = index;
            saveRMB = tempMax - xTax;
            yearLastRMB = ((myRMB - index) * 12) - ye;
            mymon = mon;
            myye = ye;
            xRmb = needRMB - mymon;
        }
    }
    return [NSString stringWithFormat:@"本月最合适领取 %.2lf \n本月扣完税所得金额 %2.lf \n本年一共能拿到钱数 %2.lf \n一年节省的钱数%.2lf \n年终奖拿多少钱%.2lf \n本月扣税 %2.lf \n年终奖扣税%.2lf",needRMB,xRmb,tempMax,saveRMB,yearLastRMB,mymon,myye];
}

//计算扣税 3500起征收
- (CGFloat)getCalWithRMB:(CGFloat)myRMB {
    CGFloat tempRmb = myRMB - 3500;
    __block CGFloat taxRmb;
    [self.fastBuckleTable enumerateObjectsUsingBlock:^(LJFastModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (tempRmb > [obj.minM floatValue] && tempRmb <= [obj.maxM floatValue]) {
            taxRmb = tempRmb * ([obj.tax floatValue]) - [obj.fastM floatValue];
            *stop = YES;
        }
    }];
    return taxRmb;
}

//计算扣税 年终奖计算 - 一年哦 一年的金额
- (CGFloat)getyearCalWithRMB:(CGFloat)myRMB {
    CGFloat tempRmb = myRMB;
    __block CGFloat taxRmb;
    [self.fastBuckleTable enumerateObjectsUsingBlock:^(LJFastModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (tempRmb > [obj.minM floatValue] && tempRmb <= [obj.maxM floatValue]) {
            taxRmb = tempRmb * ([obj.tax floatValue]) * 12 - [obj.fastM floatValue];
            *stop = YES;
        }
    }];
    return taxRmb;
}

- (NSArray <LJFastModel *>*)fastBuckleTable {
    if (!_fastBuckleTable) {
        _fastBuckleTable = [LJFastModel getLJFastModels];
    }
    return _fastBuckleTable;
}

@end

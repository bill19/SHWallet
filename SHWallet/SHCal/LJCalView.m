//
//  LJCalView.m
//  Cal
//
//  Created by sunhao on 2018/8/13.
//  Copyright © 2018年 sunhao. All rights reserved.
//

#import "LJCalView.h"

@implementation LJCalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews {
    CGFloat padding = 10.0f;
    UITextField *textRMB = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 200, 30)];
    textRMB.placeholder = @"请输入金额";
    textRMB.backgroundColor = [UIColor greenColor];
    [self addSubview:textRMB];
    self.textRMB  = textRMB;

    UIButton *calBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [calBtn setTitle:@"开始计算" forState:UIControlStateNormal];
    [calBtn setFrame:CGRectMake(20, CGRectGetMaxY(textRMB.frame) + padding, 200, 30)];
    [calBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    calBtn.backgroundColor = [UIColor yellowColor];
    [calBtn addTarget:self action:@selector(calButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:calBtn];
    self.calBtn = calBtn;

    UILabel *showLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(calBtn.frame) + padding, 200, 300)];
    showLabel.textColor = [UIColor greenColor];
    showLabel.numberOfLines = 0;
    [self addSubview:showLabel];
    self.showLabel = showLabel;
}

- (void)calButtonClick:(UIButton *)sender {

    if (self.calclick) {
        self.calclick(self.textRMB.text);
    }
}


@end

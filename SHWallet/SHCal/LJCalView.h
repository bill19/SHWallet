//
//  LJCalView.h
//  Cal
//
//  Created by sunhao on 2018/8/13.
//  Copyright © 2018年 sunhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LJCalView : UIView

@property (nonatomic, strong) UITextField *textRMB;

@property (nonatomic, strong) UIButton *calBtn;

@property (nonatomic, strong) UILabel *showLabel;

typedef void(^didCalButtonBlock)(NSString *text);
@property (nonatomic, copy) didCalButtonBlock calclick;
@end

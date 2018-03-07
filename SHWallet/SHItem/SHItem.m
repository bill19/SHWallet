//
//  SHItem.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHItem.h"

@interface SHItem ()
@property (nonatomic, weak) UIButton *item;
@end

@implementation SHItem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}


- (void)setupSubViews {
    UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
    [item setFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
    [item setImage:[UIImage imageNamed:@"sh_wallet"] forState:UIControlStateNormal];
    [item addTarget:self action:@selector(itemAction:) forControlEvents:UIControlEventTouchUpInside];
    [item setTitle:@"信用卡" forState:UIControlStateNormal];
    [item.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [item setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [item mt_verticalImageAndTitle:10.0];
    _item = item;
    [self addSubview:_item];
    
}

- (void)itemAction:(UIButton *)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(itemDidSelect:)]) {
        [self.delegate itemDidSelect:_itemModel];
    }
}

- (void)setItemModel:(SHItemModel *)itemModel {
    _itemModel = itemModel;
    [_item setImage:[UIImage imageNamed:_itemModel.image] forState:UIControlStateNormal];
    [_item setTitle:_itemModel.title forState:UIControlStateNormal];
}

@end

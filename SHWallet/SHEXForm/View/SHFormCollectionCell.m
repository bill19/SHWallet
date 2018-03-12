//
//  SHFormCollectionCell.m
//  xxxxxxxx
//
//  Created by WF on 2017/1/5.
//  Copyright © 2017年 WF. All rights reserved.
//

#import "SHFormCollectionCell.h"
@interface SHFormCollectionCell ()
@property (nonatomic, strong) UILabel *normalLab;
@end
@implementation SHFormCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        _normalLab = [[UILabel alloc] initWithFrame:self.bounds];
        _normalLab.layer.borderColor = [UIColor blackColor].CGColor;
        _normalLab.layer.borderWidth = 1.f;
        _normalLab.textAlignment = NSTextAlignmentCenter;
        _normalLab.font = [UIFont systemFontOfSize:17.f];
        [self addSubview:_normalLab];
    }
    return self;
}

- (void)setFormModel:(SHFormModel *)formModel {
    _formModel = formModel;
    _normalLab.text = _formModel.attributeName;
}

@end

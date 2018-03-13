//
//  SHFormCell.m
//  xxxxxxxx
//
//  Created by WF on 2017/1/5.
//  Copyright © 2017年 WF. All rights reserved.
//

#import "SHFormCell.h"
#import "SHFormConfig.h"
#import "Masonry.h"
@interface SHFormCell ()
@property (nonatomic, strong) UILabel *listLab;
@end

@implementation SHFormCell

+ (SHFormCell *)cellWithTableView:(UITableView *)tableView {
    NSString *ID = NSStringFromClass([SHFormCell class]);
    SHFormCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SHFormCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setAccessoryType:UITableViewCellAccessoryNone];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self setupSubViews];
        [self setupLayout];
    }
    return self;
}

- (void)setupSubViews {
    UILabel *listLab = [[UILabel alloc] init];
    listLab.layer.borderColor = [UIColor blackColor].CGColor;
    listLab.layer.borderWidth = 1.f;
    listLab.textAlignment = NSTextAlignmentCenter;
    listLab.font = [UIFont systemFontOfSize:14.f];
    _listLab = listLab;
    [self.contentView addSubview:_listLab];
}

- (void)setupLayout {
    [_listLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

- (void)setListModel:(SHFormModel *)listModel {
    _listModel = listModel;
    _listLab.text = _listModel.attributeName;
}

@end

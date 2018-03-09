//
//  BCMyTableViewCell.m
//  xxxxxxxx
//
//  Created by WF on 2017/1/5.
//  Copyright © 2017年 WF. All rights reserved.
//

#import "BCMyTableViewCell.h"

@interface BCMyTableViewCell ()
@property (nonatomic, strong) UILabel *listLab;
@end

@implementation BCMyTableViewCell

+ (BCMyTableViewCell *)cellWithTableView:(UITableView *)tableView {
    NSString *ID = NSStringFromClass([BCMyTableViewCell class]);
    BCMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell){
        cell = [[BCMyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        _listLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        _listLab.layer.borderColor = [UIColor blackColor].CGColor;
        _listLab.layer.borderWidth = 1.f;
        _listLab.textAlignment = NSTextAlignmentCenter;
        _listLab.font = [UIFont systemFontOfSize:17.f];
        [self addSubview:_listLab];
    }
    return self;
}

- (void)setListModel:(SHFormModel *)listModel {
    _listModel = listModel;
    _listLab.text = _listModel.attributeName;
}

@end

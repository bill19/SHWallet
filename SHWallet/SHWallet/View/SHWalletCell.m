//
//  SHWalletCell.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHWalletCell.h"
#import "UIColor+KNColor.h"
#define kArcColor arc4random_uniform(255)
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface SHWalletCell ()
@property (nonatomic, weak) UIImageView *cardImageView;
@property (nonatomic, weak) UILabel *cardBankLab;
@property (nonatomic, weak) UILabel *cardNumberLab;
@property (nonatomic, weak) UILabel *cardOther;
@property (nonatomic, strong)CAGradientLayer *gradientLayer;/**<渐变代码*/
@end

@implementation SHWalletCell


+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = NSStringFromClass([SHWalletCell class]);

    SHWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SHWalletCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
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

#pragma mark - UISetup
- (void)setupSubViews {
    UIImageView *cardImageView = [[UIImageView alloc] init];
    cardImageView.layer.cornerRadius = 20;
    cardImageView.layer.masksToBounds = YES;
    cardImageView.backgroundColor = [UIColor lightGrayColor];
    _cardImageView = cardImageView;
    [self.contentView addSubview:_cardImageView];

    UILabel *cardBankLab = [[UILabel alloc] init];
    cardBankLab.textColor = [UIColor colorWithHexString:@"#00FF00"];
    cardBankLab.text = @"招商银行";
    cardBankLab.font = [UIFont systemFontOfSize:17.0f];
    _cardBankLab = cardBankLab;
    [_cardImageView addSubview:_cardBankLab];

    UILabel *cardNumberLab = [[UILabel alloc] init];
    cardNumberLab.textColor = [UIColor colorWithHexString:@"#00FF00"];
    cardNumberLab.text = @"6210 3000 3385 9725";
    cardNumberLab.font = [UIFont systemFontOfSize:17.0f];
    _cardNumberLab = cardNumberLab;
    [_cardImageView addSubview:_cardNumberLab];

    UILabel *cardOther = [[UILabel alloc] init];
    cardOther.textColor = [UIColor colorWithHexString:@"#00FF00"];
    cardOther.text = @"普通卡";
    cardOther.font = [UIFont systemFontOfSize:17.0f];
    _cardOther = cardOther;
    [_cardImageView addSubview:_cardOther];

}

#pragma mark - Layout
- (void)setupLayout {
    CGFloat padding = 10.0f;
    CGFloat labHeight = 20.0f;
    [_cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(padding);
        make.top.mas_equalTo(self.contentView).offset(padding);
        make.right.mas_equalTo(self.contentView).offset(-padding);
        make.bottom.mas_equalTo(self.contentView).offset(-padding);
    }];

    [_cardBankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardImageView.mas_top).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.equalTo(@(labHeight));
    }];
    [_cardNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardBankLab.mas_bottom).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.equalTo(@(labHeight));
    }];
    [_cardOther mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardNumberLab.mas_bottom).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.equalTo(@(labHeight));
    }];
}

- (void)setWalletModel:(SHWalletModel *)walletModel {
    _walletModel = walletModel;
    _cardBankLab.text = _walletModel.cardBank;
    _cardNumberLab.text = _walletModel.cardNum;
    _cardNumberLab.text = _walletModel.cardOther;
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(__bridge id)RGB(kArcColor, kArcColor, kArcColor).CGColor, (__bridge id)RGB(kArcColor, kArcColor, kArcColor).CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1.0, 0);
        _gradientLayer.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - 20, 100);
    }
    return _gradientLayer;
}
@end

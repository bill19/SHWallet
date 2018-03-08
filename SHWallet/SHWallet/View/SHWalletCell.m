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
@property (nonatomic, weak) UILabel *cardCvv;
@property (nonatomic, weak) UILabel *cardOther;
@property (nonatomic, strong)CAGradientLayer *gradientLayer;/**<渐变代码*/
@end

@implementation SHWalletCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {

    NSString *ID = @"SHWalletCell";

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
    [cardImageView.layer addSublayer:self.gradientLayer];
    _cardImageView = cardImageView;
    [self.contentView addSubview:_cardImageView];

    UILabel *cardBankLab = [[UILabel alloc] init];
    cardBankLab.textColor = [UIColor blackColor];
    cardBankLab.text = @"招商银行";
    cardBankLab.font = [UIFont systemFontOfSize:17.0f];
    _cardBankLab = cardBankLab;
    [_cardImageView addSubview:_cardBankLab];

    UILabel *cardNumberLab = [[UILabel alloc] init];
    cardNumberLab.textColor = [UIColor blackColor];
    cardNumberLab.text = @"6210 3000 3385 9725";
    cardNumberLab.font = [UIFont systemFontOfSize:17.0f];
    _cardNumberLab = cardNumberLab;
    [_cardImageView addSubview:_cardNumberLab];

    UILabel *cardCvv = [[UILabel alloc] init];
    cardCvv.textColor = [UIColor blackColor];
    cardCvv.text = @"567";
    cardCvv.font = [UIFont systemFontOfSize:17.0f];
    _cardCvv = cardCvv;
    [_cardImageView addSubview:_cardCvv];

    UILabel *cardOther = [[UILabel alloc] init];
    cardOther.textColor = [UIColor blackColor];
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
        make.left.mas_equalTo(self.contentView.mas_left).offset(padding);
        make.top.mas_equalTo(self.contentView.mas_top).offset(padding);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-padding);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-padding);
    }];

    [_cardBankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardImageView.mas_top).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.mas_equalTo(@(labHeight));
    }];
    [_cardNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardBankLab.mas_bottom).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.mas_equalTo(@(labHeight));
    }];
    [_cardCvv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardNumberLab.mas_bottom).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.mas_equalTo(@(labHeight));
    }];
    [_cardOther mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_cardCvv.mas_bottom).offset(padding);
        make.left.mas_equalTo(_cardImageView.mas_left).offset(padding);
        make.right.mas_equalTo(_cardImageView.mas_right).offset(-padding);
        make.height.mas_equalTo(@(labHeight));
        make.bottom.mas_equalTo(self.cardImageView.mas_bottom).offset(-padding);
    }];
}


- (void)setWalletModel:(SHWalletModel *)walletModel {
    _walletModel = walletModel;
    _cardBankLab.text = [NSString stringWithFormat:@"银行 %@",_walletModel.cardBank];
    _cardNumberLab.text = [NSString stringWithFormat:@"卡号 %@",_walletModel.cardNum];
    _cardOther.text = [NSString stringWithFormat:@"备注 %@",_walletModel.cardOther];
    _cardCvv.text = [NSString stringWithFormat:@"安全 %@",_walletModel.cardCvv];
}

- (CAGradientLayer *)gradientLayer {
    if (!_gradientLayer) {
        _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.colors = @[(__bridge id)RGB(kArcColor, kArcColor, kArcColor).CGColor, (__bridge id)RGB(kArcColor, kArcColor, kArcColor).CGColor];
        _gradientLayer.startPoint = CGPointMake(0, 0);
        _gradientLayer.endPoint = CGPointMake(1.0, 0);
        _gradientLayer.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width - 20, 150);
    }
    return _gradientLayer;
}
@end

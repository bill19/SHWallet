//
//  SHWalletCell.h
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "SHWalletModel.h"
@protocol SHWalletCellDelegate <NSObject>

@optional

@end

@interface SHWalletCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SHWalletModel *walletModel;

@property (nonatomic, assign) id<SHWalletCellDelegate>delegate;
@end

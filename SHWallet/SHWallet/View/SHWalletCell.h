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
@interface SHWalletCell : UITableViewCell

/*创建TableviewCell**/
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SHWalletModel *walletModel;
@end

//
//  BCMyTableViewCell.h
//  xxxxxxxx
//
//  Created by WF on 2017/1/5.
//  Copyright © 2017年 WF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHFormModel.h"

@interface BCMyTableViewCell : UITableViewCell

+ (BCMyTableViewCell *)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) SHFormModel *listModel;

@end

//
//  SHWalletController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHWalletController.h"
#import "SHWalletModel.h"
#import "Masonry.h"
@interface SHWalletController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray <SHWalletModel *>*tableDataSource;

@end

@implementation SHWalletController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupController];
    [self request];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark layout subviews
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Layout subviews in this method.
}

#pragma mark - button action

#pragma mark - gesture

#pragma mark - KVO

#pragma mark - noticfication

#pragma mark - data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    SHWalletModel *model = [self modelForIndexPath:indexPath];
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - HTTP request
- (void)request {

}

#pragma mark - model handler
- (SHWalletModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.tableDataSource.count) {
        return self.tableDataSource[indexPath.row];
    }
    return nil;
}

#pragma mark - others

#pragma mark - setters

#pragma mark getters
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        tableView.height = [UIScreen mainScreen].bounds.size.height - 64;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 100.0f;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.tableFooterView = [UITableViewHeaderFooterView new];
        [self.view addSubview:tableView];
        _tableView = tableView;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            if (@available(iOS 11.0, *)) {
                make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
            } else {
                make.bottom.equalTo(self.view);
            }
        }];
    }
    return _tableView;
}

- (NSArray<SHWalletModel *> *)tableDataSource {

    if (!_tableDataSource) {
        _tableDataSource = [NSArray array];
    }
    return _tableDataSource;

}
@end

//
//  SHWalletController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/7.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHWalletController.h"
#import "SHWalletModel.h"
#import "SHWalletCell.h"
#import "Masonry.h"
#import "MJExtension.h"
#import "CardIO.h"
#import "Toast.h"
#import "LRKeychain.h"
#import "CardIOPaymentViewControllerDelegate.h"
static NSString *KcardKey = @"SHCARDKEY";
static NSString *KcardNum = @"卡号";
static NSString *KcardOther = @"备注信息";
static NSString *KcardBank = @"银行";
static NSString *KcardCvv = @"Cvv";
@interface SHWalletController () <UITableViewDelegate,UITableViewDataSource,SHWalletCellDelegate,CardIOPaymentViewControllerDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray <SHWalletModel *>*tableDataSource;
@property (nonatomic, strong) SHWalletModel *changeModel;

@end

@implementation SHWalletController

#pragma mark - life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[SHWalletCell class] forCellReuseIdentifier:@"SHWalletCell"];
    [self setupController];
    [self request];
}

- (void)dealloc {
    
}

#pragma mark setup controller
- (void)setupController {
    self.title = @"卡包";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCard:)],[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(scanCard:)]];
}

#pragma mark layout subviews
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    // Layout subviews in this method.
}

#pragma mark - button action
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [CardIOUtilities preload];
}

//开始扫描
- (void)scanCard:(id)sender {
    self.changeModel = [[SHWalletModel alloc] init];
    CardIOPaymentViewController *scanViewController = [[CardIOPaymentViewController alloc] initWithPaymentDelegate:self];
    [self presentViewController:scanViewController animated:YES completion:nil];
}

/**
 新增
 */
- (void)addCard:(id)sender {
    self.changeModel = [[SHWalletModel alloc] init];
    [self showAddMessage:[SHWalletModel new]];
}

//取消扫描
- (void)userDidCancelPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    NSLog(@"User canceled payment info");
    // Handle user cancellation here...
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)showAddMessage:(SHWalletModel *)model {
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"添加信息" message:@"添加一个银行卡信息" preferredStyle:UIAlertControllerStyleAlert];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = KcardNum;
        textField.text = model.cardNum;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = KcardBank;
        textField.text = model.cardBank;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = KcardCvv;
        textField.text = model.cardCvv;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alertView addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = KcardOther;
        textField.text = model.cardOther;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
    }];
    [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];
    [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.tableDataSource insertObject:self.changeModel  atIndex:0];
        [self.tableView reloadData];
        [self savaSource];
    }]];
    [self presentViewController:alertView animated:YES completion:nil];
}

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    if ([textField.placeholder isEqualToString:KcardNum]) {
        self.changeModel.cardNum = textField.text;
    }
    if ([textField.placeholder isEqualToString:KcardBank]) {
        self.changeModel.cardBank = textField.text;
    }
    if ([textField.placeholder isEqualToString:KcardCvv]) {
        self.changeModel.cardCvv = textField.text;
    }
    if ([textField.placeholder isEqualToString:KcardOther]) {
        self.changeModel.cardOther = textField.text;
    }
}
//扫描完成
- (void)userDidProvideCreditCardInfo:(CardIOCreditCardInfo *)info inPaymentViewController:(CardIOPaymentViewController *)scanViewController {
    //扫描结果
    [scanViewController dismissViewControllerAnimated:YES completion:nil];
    _changeModel.cardNum = info.cardNumber;
    _changeModel.cardOther = [NSString stringWithFormat:@"%ld / %ld",info.expiryMonth,info.expiryYear];
    _changeModel.cardCvv = info.cvv;
    _changeModel.cardBank = info.cardholderName;
    [self showAddMessage:_changeModel];
}
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
    SHWalletCell *wallerCell = [SHWalletCell cellWithTableView:_tableView];
    wallerCell.walletModel = [self modelForIndexPath:indexPath];
    return wallerCell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.changeModel = self.tableDataSource[indexPath.row];
    [self showAddMessage:self.changeModel];
}

- (void)longCopy:(SHWalletModel *)model {
    UIPasteboard *pboard = [UIPasteboard generalPasteboard];
    pboard.string = model.cardNum;
    [self.view makeToast:@"拷贝成功"];
}

/**
 *  左滑cell时出现什么按钮
 */
- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *delAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        // 删除模型
        [self.tableDataSource removeObjectAtIndex:indexPath.row];
        [self savaSource];
        // 刷新
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }];

    UITableViewRowAction *copyAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"拷贝" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self longCopy:self.tableDataSource[indexPath.row]];
    }];

    return @[copyAction, delAction];
}
#pragma mark - HTTP request
- (void)request {
    NSArray *arr = [LRKeychain getKeychainDataForKey:KcardKey];
    for (NSDictionary *dict in arr) {
        [self.tableDataSource addObject:[SHWalletModel mj_objectWithKeyValues:dict]];
    }
    [self.tableView reloadData];
}

#pragma mark - model handler
- (SHWalletModel *)modelForIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.tableDataSource.count) {
        return self.tableDataSource[indexPath.row];
    }
    return nil;
}

#pragma mark - others
/**
 存信息
 */
- (void)savaSource {
    NSMutableArray *mu = [NSMutableArray array];
    for (SHWalletModel *model in self.tableDataSource) {
        [mu addObject:[model mj_keyValues]];
    }
    [LRKeychain addKeychainData:mu forKey:KcardKey];
}

#pragma mark - setters

#pragma mark getters
- (UITableView *)tableView {
    if (_tableView == nil) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
            make.left.right.top.bottom.mas_equalTo(self.view).offset(0);
        }];
    }
    return _tableView;
}

- (NSMutableArray<SHWalletModel *> *)tableDataSource {

    if (!_tableDataSource) {
        _tableDataSource = [NSMutableArray array];
    }
    return _tableDataSource;
}
@end

//
//  SHEXFormController.m
//  SHWallet
//
//  Created by HaoSun on 2018/3/8.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHEXFormController.h"

@interface SHEXFormController ()

@end

@implementation SHEXFormController

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

#pragma mark - delegate

#pragma mark - data source

#pragma mark - HTTP request
- (void)request {

}
#pragma mark - model handler

#pragma mark - others

#pragma mark - setters

#pragma mark getters

@end

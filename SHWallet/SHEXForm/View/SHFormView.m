//
//  SHFormView.m
//  xxxxxxxx
//
//  Created by WF on 2017/1/14.
//  Copyright © 2017年 WF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHFormView.h"
#import "SHFormCollectionCell.h"
#import "SHFormCell.h"
@interface SHFormView()
<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <SHFormModel *>*X_AxisSource;
@property (nonatomic, strong) NSArray <SHFormModel *>*Y_AxisSource;
@property (nonatomic, strong) NSString *originPoint;
@end
@implementation SHFormView

- (instancetype)initWithFrame:(CGRect)frame X_Axis:(NSArray <SHFormModel *>*)X_Axis Y_Axis:(NSArray <SHFormModel *>*)Y_Axis Origin:(NSString *)origin {
    self = [super initWithFrame:frame];
    if (self) {
        self.X_AxisSource = X_Axis;
        self.Y_AxisSource = Y_Axis;
        self.originPoint = origin;
        [self creatTableListViewUI];
    }
    return self;
}

- (void)creatTableListViewUI {
    //整体布局 右 除了第一列以外的底层布局
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kFirstCellWidth, 0,self.frame.size.width - kFirstCellWidth, self.frame.size.height)];

    _scrollView.contentSize = CGSizeMake(kNormalCellWidth * ([[SHFormConfig creatX_Axis] count]), _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];
    //坐标为0,0的坐标点 原点
    UILabel * originLabel = [SHFormConfig creatFormTitleLabel];
    originLabel.text = _originPoint;
    originLabel.frame = CGRectMake(0, 0, kFirstCellWidth, kNormalCellHeight);
    [self addSubview:originLabel];

    [self.tableView registerClass:[SHFormCell class] forCellReuseIdentifier:NSStringFromClass([SHFormCell class])];
    [self addSubview:self.tableView];

    for (NSInteger index = 0; index < [[SHFormConfig creatX_Axis] count]; index ++) {
        UILabel *normalLab = [SHFormConfig creatFormNormalLabel];
        normalLab.frame = CGRectMake(index * kNormalCellWidth, 0, kNormalCellWidth, kNormalCellHeight);
        normalLab.text = [[[SHFormConfig creatX_Axis] objectAtIndex:index] attributeName];
        [_scrollView addSubview:normalLab];
    }
    [_scrollView addSubview:self.collectionView];
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[SHFormCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([SHFormCollectionCell class])];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooterIdentifier];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNormalCellHeight, kNormalCellWidth*(_Y_AxisSource.count - 1), self.frame.size.height - kNormalCellHeight) collectionViewLayout:[SHFormConfig creatFormNormalLayout]];
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        _collectionView = collectionView;
    }
    return _collectionView;
}

#pragma mark--scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _collectionView) {
        _tableView.contentOffset = scrollView.contentOffset;
    }else if (scrollView == _tableView){
        _collectionView.contentOffset = scrollView.contentOffset;
    }
}

#pragma mark ---- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _Y_AxisSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _X_AxisSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SHFormCollectionCell *cell = (SHFormCollectionCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SHFormCollectionCell class]) forIndexPath:indexPath];
    NSArray *formSource = [self.formDataSource objectAtIndex:indexPath.section];
    cell.formModel = [formSource objectAtIndex:indexPath.item];
    return cell;
}

// 和UITableView类似，UICollectionView也可设置段头段尾
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeaderIdentifier forIndexPath:indexPath];
        if(headerView == nil) {
            headerView = [[UICollectionReusableView alloc] init];
        }
        headerView.backgroundColor = [UIColor grayColor];
        return headerView;
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        UICollectionReusableView *footerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFooterIdentifier forIndexPath:indexPath];
        if(footerView == nil){
            footerView = [[UICollectionReusableView alloc] init];
        }
        footerView.backgroundColor = [UIColor lightGrayColor];
        return footerView;
    }
    
    return nil;
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath{
    
}
#pragma mark ---- UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return (CGSize){kNormalCellWidth,kNormalCellHeight};//方块大小
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);//前面2个数字是整个控件前的间隔
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return (CGSize){.0,.0};//后面数据为头高度
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return (CGSize){0,.0};//后面数据为低高度
}
#pragma mark ---- UICollectionViewDelegate

// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(successOfCollectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate successOfCollectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark tableView

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNormalCellHeight, kFirstCellWidth, self.frame.size.height - kNormalCellHeight) style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView = tableView;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _Y_AxisSource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SHFormCell *cell = [SHFormCell cellWithTableView:tableView];
    cell.listModel = [_Y_AxisSource objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kNormalCellHeight;
}

- (NSArray<SHFormModel *> *)X_AxisSource {
    if (!_X_AxisSource) {
        _X_AxisSource = [NSArray array];
    }
    return _X_AxisSource;
}

- (NSArray<SHFormModel *> *)Y_AxisSource {
    if (!_Y_AxisSource) {
        _Y_AxisSource = [NSArray array];
    }
    return _Y_AxisSource;
}

- (void)setFormDataSource:(NSArray<NSArray<SHFormModel *> *> *)formDataSource {
    _formDataSource = formDataSource;
}

@end

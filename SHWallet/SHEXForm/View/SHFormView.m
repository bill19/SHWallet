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
#import "UIColor+KNColor.h"
@interface SHFormView()
<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel * originLabel;
@end
@implementation SHFormView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}
- (void)setupSubViews {
    //整体布局 右 除了第一列以外的底层布局
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(kFirstCellWidth, 0,self.frame.size.width - kFirstCellWidth, self.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(kNormalCellWidth * ([[SHFormConfig creatX_Axis] count]), _scrollView.frame.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:_scrollView];

    //坐标为0,0的坐标点 原点
    UILabel * originLabel = [[UILabel alloc] init];
    originLabel.frame = CGRectMake(0, 0, kFirstCellWidth, kNormalCellHeight);
    _originLabel = originLabel;
    [self addSubview:_originLabel];

    [self.tableView registerClass:[SHFormCell class] forCellReuseIdentifier:NSStringFromClass([SHFormCell class])];
    [self addSubview:self.tableView];

    [_scrollView addSubview:self.collectionView];
    // 注册cell、sectionHeader、sectionFooter
    [_collectionView registerClass:[SHFormCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([SHFormCollectionCell class])];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeaderIdentifier];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:kFooterIdentifier];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNormalCellHeight, kNormalCellWidth*([SHFormConfig creatY_Axis].count - 1), self.frame.size.height - kNormalCellHeight) collectionViewLayout:[SHFormConfig creatFormNormalLayout]];
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
    if (formSource.count > 0) {
        cell.formModel = [formSource objectAtIndex:indexPath.item];
    }
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

- (void)setX_AxisSource:(NSArray<SHFormModel *> *)X_AxisSource {
    _X_AxisSource = X_AxisSource;
    for (NSInteger index = 0; index < [_X_AxisSource count]; index ++) {
        SHFormModel *model = [_X_AxisSource objectAtIndex:index];
        UILabel *normalLab = [[UILabel alloc] init];
        normalLab.frame = CGRectMake(index * kNormalCellWidth, 0, kNormalCellWidth, kNormalCellHeight);
        normalLab.text = model.attributeName;
        normalLab.layer.borderColor = model.formBordeColor.CGColor;
        normalLab.layer.borderWidth = model.formBordeWidth;
        normalLab.textAlignment = NSTextAlignmentCenter;
        normalLab.backgroundColor = model.formBgColor;
        normalLab.font = [UIFont systemFontOfSize:model.formFontSize];
        [_scrollView addSubview:normalLab];
    }
}

- (void)setY_AxisSource:(NSArray<SHFormModel *> *)Y_AxisSource {
    _Y_AxisSource = Y_AxisSource;
}

- (void)setFormDataSource:(NSArray<NSArray<SHFormModel *> *> *)formDataSource {
    _formDataSource = formDataSource;
}

- (void)setOriginPointModel:(SHFormModel *)originPointModel {
    _originPointModel = originPointModel;
    _originLabel.text = _originPointModel.attributeName;
    _originLabel.layer.borderColor = _originPointModel.formBordeColor.CGColor;
    _originLabel.backgroundColor = _originPointModel.formBgColor;
    _originLabel.layer.borderWidth = _originPointModel.formBordeWidth;
    _originLabel.textAlignment = NSTextAlignmentCenter;
    _originLabel.font = [UIFont systemFontOfSize:_originPointModel.formFontSize];
}
@end

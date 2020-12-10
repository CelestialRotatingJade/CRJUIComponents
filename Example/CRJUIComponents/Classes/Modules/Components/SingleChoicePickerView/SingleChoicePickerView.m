//
//  SingleChoicePickerView.m
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/10/23.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//
#import "SingleChoiceCell.h"
#import "SingleChoicePickerView.h"

@interface SingleChoicePickerView () <UITableViewDelegate, UITableViewDataSource>
///toolBar
@property (nonatomic, strong) UIView *toolBar;
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UILabel *titleL;

///tableView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UIView *debugView;

@property (nonatomic, strong) NSString *selString;
@end

@implementation SingleChoicePickerView
- (void)buildViewsInContentView:(UIView *)contentView {
    // 顶部白色的view
    self.toolBar.frame = CGRectMake(0, 0, contentView.width, 40);
    [contentView addSubview:self.toolBar];
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        self.titleL.text = self.info;
    }

    // 创建listView
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentView.width, (contentView.height - self.toolBar.height - self.tableView.rowHeight) / 2)];
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentView.width, (contentView.height - self.toolBar.height - self.tableView.rowHeight) / 2)];
    self.dataSource = [NSMutableArray array];

    self.tableView.frame = CGRectMake(0, self.toolBar.height, contentView.width, contentView.height - self.toolBar.height);
    self.tableView.tableHeaderView = tableHeaderView;
    self.tableView.tableFooterView = tableFooterView;
    [contentView addSubview:self.tableView];

    UIView *maskView1 = [UIView new];
    maskView1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15];
    maskView1.userInteractionEnabled = NO;
    UIView *maskView2 = [UIView new];
    maskView2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15];
    maskView2.userInteractionEnabled = NO;
    UIView *debugView = [UIView new];
    debugView.backgroundColor = [UIColor clearColor];
    debugView.userInteractionEnabled = NO;

    [contentView addSubview:maskView1];
    [contentView addSubview:maskView2];
    [contentView addSubview:debugView];
    [debugView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.right.equalTo(self.tableView);
      make.centerY.equalTo(self.tableView.mas_centerY);
      make.height.mas_equalTo(self.tableView.rowHeight);
    }];
    [maskView1 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.right.equalTo(self.tableView);
      make.top.equalTo(self.tableView.mas_top);
      make.bottom.equalTo(debugView.mas_top);
    }];
    [maskView2 mas_makeConstraints:^(MASConstraintMaker *make) {
      make.left.right.equalTo(self.tableView);
      make.bottom.equalTo(self.tableView.mas_bottom);
      make.top.equalTo(debugView.mas_bottom);
    }];
    self.debugView = debugView;
}

- (void)configPicker {
    [self.dataSource removeAllObjects];

    [self.showDatas enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      [self.dataSource addObject:obj];
    }];

    if (self.selectedItem) {
        if ([self.selectedItem isKindOfClass:[NSString class]]) {
            NSString *selString = self.selectedItem;
            if ([self.dataSource containsObject:selString]) {
                self.selString = selString;
            }
        }
    }
    ///默认值
    
    if (!self.selString && self.dataSource.count) {
        self.selString = [self.dataSource objectAtIndex:0];
    }
    [self.tableView reloadData];
    if (self.selString) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView performWithoutAnimation:^{
                NSInteger index = [self.dataSource indexOfObject:self.selString];
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
            }];
        });
    }
}

+ (CGFloat)contentViewHeight {
    CGFloat bottomHeight = CRJDeviceInfo.fringeScreenBottomSafeHeight;
    return 222.f + 40.f + bottomHeight;
}

- (void)clickCancleBtn {
    [self hideFromKeyWindow];
}

- (void)clickSureBtn {
    [self hideFromKeyWindow];
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerView:didSelectedIndexs:items:)]) {
        [self.delegate baseShowPickerView:self didSelectedIndexs:nil items:self.selString ? @[ self.selString ] : @[]];
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    SingleChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[SingleChoiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.indexPath = indexPath;
    NSString *text = [self.dataSource objectAtIndex:indexPath.row];

    cell.titleLabel.text = text;
    cell.titleLabel.font = [UIFont systemFontOfSize:16];
    if ([self.selString isEqualToString:text]) {
        cell.titleLabel.textColor = [UIColor blackColor];
    } else {
        cell.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.tableView.rowHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

#pragma mark - UIScrollView's delegate.
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 停止类型1、停止类型2
    BOOL scrollToScrollStop = !scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
    if (scrollToScrollStop) {
        [self scrollViewDidEndScroll];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (!decelerate) {
        // 停止类型3
        BOOL dragToDragStop = scrollView.tracking && !scrollView.dragging && !scrollView.decelerating;
        if (dragToDragStop) {
            [self scrollViewDidEndScroll];
        }
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat rowHeight = self.tableView.rowHeight;
    int verticalOffset = ((int)targetContentOffset->y % (int)rowHeight);

    if (velocity.y < 0) {
        targetContentOffset->y -= verticalOffset;

    } else if (velocity.y > 0) {
        targetContentOffset->y += (rowHeight - verticalOffset);

    } else {
        if (verticalOffset < rowHeight / 2) {
            targetContentOffset->y -= verticalOffset;

        } else {
            targetContentOffset->y += (rowHeight - verticalOffset);
        }
    }
}

#pragma mark - scrollView 滚动停止

- (void)scrollViewDidEndScroll {
    NSLog(@"停止滚动了！！！");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray<SingleChoiceCell *> *array = [self.tableView visibleCells];
    [array enumerateObjectsUsingBlock:^(SingleChoiceCell *_Nonnull cell, NSUInteger idx, BOOL *_Nonnull stop) {
        CGRect rect = [cell convertRect:cell.bounds toView:self.debugView];
        CGFloat y = rect.origin.y;
        if (fabs(y) <= self.tableView.rowHeight / 2) {
            self.selString = cell.titleLabel.text;
            cell.titleLabel.textColor = [UIColor blackColor];
        } else {
            cell.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        }
    }];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 48;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.decelerationRate = UIScrollViewDecelerationRateFast;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _tableView.estimatedRowHeight = 0;
            _tableView.estimatedSectionHeaderHeight = 0;
            _tableView.estimatedSectionFooterHeight = 0;
        }
    }
    return _tableView;
}

- (UIView *)toolBar {
    if (!_toolBar) {
        _toolBar = [[UIView alloc] init];
        _toolBar.backgroundColor = [UIColor whiteColor];
        [_toolBar addSubview:self.cancleBtn];
        [_toolBar addSubview:self.sureBtn];
        [_toolBar addSubview:self.titleL];
        
        UIView *separator = [[UIView alloc] init];
        separator.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_toolBar addSubview:separator];

        
        [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.cancleBtn.superview).offset(16);
          make.centerY.equalTo(self.cancleBtn.superview).offset(0);
        }];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.right.equalTo(self.sureBtn.superview).offset(-16);
          make.centerY.equalTo(self.sureBtn.superview).offset(0);
        }];
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.titleL.superview.mas_left).offset(50);
          make.right.equalTo(self.titleL.superview.mas_right).offset(-50);
          make.centerY.equalTo(self.titleL.superview).offset(0);
        }];
        [separator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(separator.superview.mas_bottom).offset(0);
            make.leading.equalTo(separator.superview.mas_leading);
            make.trailing.equalTo(separator.superview.mas_trailing);
            make.height.mas_equalTo(1);
        }];
    }
    return _toolBar;
}

- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textAlignment = NSTextAlignmentCenter;
    }
    return _titleL;
}

- (UIButton *)cancleBtn {
    if (!_cancleBtn) {
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [customBtn setTitle:@"取消" forState:UIControlStateNormal];
        [customBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [customBtn addTarget:self action:@selector(clickCancleBtn) forControlEvents:UIControlEventTouchUpInside];
        _cancleBtn = customBtn;
    }
    return _cancleBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [customBtn setTitle:@"确定" forState:UIControlStateNormal];
        [customBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [customBtn addTarget:self action:@selector(clickSureBtn) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn = customBtn;
    }
    return _sureBtn;
}
@end

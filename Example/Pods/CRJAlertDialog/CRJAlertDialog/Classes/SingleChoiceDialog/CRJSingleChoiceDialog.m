//
//  CRJSingleChoiceDialog.m
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "CRJSingleChoiceDialog.h"

@interface CRJSingleChoiceDialog ()<UITableViewDelegate, UITableViewDataSource>
///tableView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign) NSInteger selectIndex;

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIView *centerMarkView;

@end

@implementation CRJSingleChoiceDialog
static NSString *identifier = @"cell";
+ (TransitionAnimator *)defaultAnimator {
    DLAnimationBottom *animator = [[DLAnimationBottom alloc] init];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    animator.contentHeightRatio = 250.f / screenH;
    return animator;
}
#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickConfirm {
    NSMutableArray *items = [NSMutableArray array];
    if (self.dataSource && self.selectIndex < self.dataSource.count) {
        [items addObject:[self.dataSource objectAtIndex:self.selectIndex]];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialog:didSelectedItems:)]) {
        [self.delegate baseDialog:self didSelectedItems:items];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - UI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 顶部
    UIView *topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    [self.view addSubview:topBarView];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"请选择";
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(titleLabel.superview);
    }];
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        titleLabel.text = self.info;
    }
    
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cancelBtn.superview).offset(15);
        make.centerY.equalTo(cancelBtn.superview);
    }];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(confirmBtn.superview).offset(-15);
        make.centerY.equalTo(confirmBtn.superview);
    }];
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    
#pragma mark - 其他
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat contentViewH = screenH * self.animator.contentHeightRatio;
    CGFloat tableViewH = contentViewH - topBarView.height;

    self.dataSource = [NSMutableArray array];

    // 创建listView
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, (tableViewH - self.tableView.rowHeight) / 2)];
    UIView *tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, (tableViewH - self.tableView.rowHeight) / 2)];

    self.tableView.tableHeaderView = tableHeaderView;
    self.tableView.tableFooterView = tableFooterView;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.tableView.superview);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    
    
    [self.view addSubview:self.maskView];
    [self.maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.maskView.superview);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    
    
    
    if (!self.cellClass) {
        self.cellClass = CRJSingleChoiceDialogCell.class;
    }
    [self.tableView registerClass:self.cellClass forCellReuseIdentifier:identifier];
    
    [self setupInitialData];
}

- (void)setupInitialData {
    [self.dataSource removeAllObjects];

    [self.showDatas enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
      [self.dataSource addObject:obj];
    }];

    ///默认值
    if (self.selectedItem && [self.dataSource containsObject:self.selectedItem]) {
        self.selectIndex = [self.dataSource indexOfObject:self.selectedItem];
    }

    [self.tableView reloadData];
    if (self.dataSource > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView performWithoutAnimation:^{
                NSInteger index = self.selectIndex;
                [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
            }];
        });
    }
}


#pragma mark -
#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if ([cell isKindOfClass:CRJSingleChoiceDialogCell.class]) {
        ((CRJSingleChoiceDialogCell *)cell).data = [self.dataSource objectAtIndex:indexPath.row];
        [((CRJSingleChoiceDialogCell *)cell) loadContent];
        [((CRJSingleChoiceDialogCell *)cell) setCellSelect:indexPath.row == self.selectIndex];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
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
    NSArray<UITableViewCell *> *array = [self.tableView visibleCells];
    [array enumerateObjectsUsingBlock:^(UITableViewCell *cell, NSUInteger idx, BOOL *_Nonnull stop) {
        if ([cell isKindOfClass:CRJSingleChoiceDialogCell.class]) {
            CGRect rect = [cell convertRect:cell.bounds toView:self.centerMarkView];
            CGFloat y = rect.origin.y;
            if (fabs(y) <= self.tableView.rowHeight / 2) {
                self.selectIndex = [self.dataSource indexOfObject:((CRJSingleChoiceDialogCell *)cell).data];
                [((CRJSingleChoiceDialogCell *)cell) setCellSelect:YES];
            } else {
                [((CRJSingleChoiceDialogCell *)cell) setCellSelect:NO];
            }
        }
    }];
}


#pragma mark - 懒加载
- (CRJSingleChoiceDialog *(^)(Class cellClass))withCellClass;
{
    return ^ CRJSingleChoiceDialog * (Class cellClass) {
        self.cellClass = cellClass;
        return self;
    };
}


#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
        } else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
    }
    return _tableView;
}

- (UIView *)maskView {
    if (!_maskView) {
        _maskView = [[UIView alloc] init];
        _maskView.userInteractionEnabled = NO;
        UIView *maskView1 = [UIView new];
        maskView1.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15];
        maskView1.userInteractionEnabled = NO;
        UIView *maskView2 = [UIView new];
        maskView2.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.15];
        maskView2.userInteractionEnabled = NO;
        UIView *centerMarkView = [UIView new];
        centerMarkView.backgroundColor = [UIColor clearColor];
        centerMarkView.userInteractionEnabled = NO;

        [_maskView addSubview:maskView1];
        [_maskView addSubview:maskView2];
        [_maskView addSubview:centerMarkView];
        [centerMarkView mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.equalTo(centerMarkView.superview);
          make.centerY.equalTo(centerMarkView.superview.mas_centerY);
          make.height.mas_equalTo(self.tableView.rowHeight);
        }];
        [maskView1 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.equalTo(maskView1.superview);
          make.top.equalTo(maskView1.superview);
          make.bottom.equalTo(centerMarkView.mas_top);
        }];
        [maskView2 mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.right.equalTo(maskView2.superview);
          make.bottom.equalTo(maskView2.superview);
          make.top.equalTo(centerMarkView.mas_bottom);
        }];
        self.centerMarkView = centerMarkView;
    }
    return _maskView;
}

@end

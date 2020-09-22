//
//  CRJBaseCollectionViewScreen.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "CRJBaseViewScreen.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRJBaseCollectionViewScreen : CRJBaseViewScreen<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/// RecylerView
@property(nonatomic, strong, readonly) UICollectionView *recylerView;

/// 当前页 defalut is 1
@property(nonatomic, assign) NSInteger page;
/// 每一页的数据 defalut is 20
@property(nonatomic, assign) NSInteger pageSize;
/// 数据源
@property(nonatomic, strong) NSMutableArray *dataSource;


- (UICollectionView *)preferredRecylerView;
- (UICollectionViewLayout *)preferredRecylerViewLayout;

#pragma mark - 加载&上下拉刷新事件
/// 请求数据
- (void)loadNewData;

@end

NS_ASSUME_NONNULL_END

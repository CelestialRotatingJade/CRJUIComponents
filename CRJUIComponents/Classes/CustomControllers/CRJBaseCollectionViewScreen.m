//
//  CRJBaseCollectionViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "CRJBaseCollectionViewScreen.h"

@interface CRJBaseCollectionViewScreen ()
/// RecylerView
@property(nonatomic, strong, readwrite) UICollectionView *recylerView;

@end

@implementation CRJBaseCollectionViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.recylerView.frame = CGRectMake(0, CGRectGetMaxY(self.appBar.frame), self.contentView.width, self.contentView.height - CGRectGetMaxY(self.appBar.frame));
}

- (void)setup {
    [super setup];
    self.page = 1;
    self.pageSize = 20;
}


- (void)initSubviews {
    [super initSubviews];
    
    if (!_recylerView) {
        UICollectionView *recylerView = [self preferredRecylerView];
        [recylerView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self.contentView addSubview:recylerView];
        self.recylerView = recylerView;
    }
}

- (UICollectionView *)preferredRecylerView {
    UICollectionView *recylerView = [[UICollectionView alloc] initWithFrame:self.contentView.bounds collectionViewLayout:[self preferredRecylerViewLayout]];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.delegate = self;
    recylerView.dataSource = self;
    return recylerView;
}

- (UICollectionViewLayout *)preferredRecylerViewLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return layout;
}

#pragma mark - 加载&上下拉刷新事件
/// 请求数据
- (void)loadNewData {}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - getter setter
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end

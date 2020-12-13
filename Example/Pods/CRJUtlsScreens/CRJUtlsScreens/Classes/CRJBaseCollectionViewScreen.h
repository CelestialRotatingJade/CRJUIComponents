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

- (UICollectionView *)preferredRecylerView;
- (UICollectionViewLayout *)preferredRecylerViewLayout;
@end

NS_ASSUME_NONNULL_END

//
//  CRJBaseTabViewScreen.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "CRJBaseViewScreen.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRJBaseTabViewScreen : CRJBaseViewScreen<UITableViewDelegate, UITableViewDataSource>
/// RecylerView
@property(nonatomic, strong, readonly) UITableView *recylerView;

- (UITableView *)preferredRecylerView;
- (UITableViewStyle)preferredRecylerViewStyle;
@end

NS_ASSUME_NONNULL_END

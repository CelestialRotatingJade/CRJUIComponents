//
//  CRJBaseTabViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "CRJBaseTabViewScreen.h"

@interface CRJBaseTabViewScreen ()
/// RecylerView
@property (nonatomic, strong, readwrite) UITableView *recylerView;
@end

@implementation CRJBaseTabViewScreen

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
        UITableView *recylerView = [self preferredRecylerView];
        recylerView.estimatedRowHeight = 0;
        recylerView.estimatedSectionHeaderHeight = 0;
        recylerView.estimatedSectionFooterHeight = 0;
        [recylerView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [self.contentView addSubview:recylerView];
        self.recylerView = recylerView;
    }
}

- (UITableView *)preferredRecylerView {
    UITableView *recylerView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:[self preferredRecylerViewStyle]];
    recylerView.backgroundColor = [UIColor clearColor];
    recylerView.separatorStyle = UITableViewCellSeparatorStyleNone;
    recylerView.delegate = self;
    recylerView.dataSource = self;
    return recylerView;
}

- (UITableViewStyle)preferredRecylerViewStyle {
    return UITableViewStylePlain;
}


#pragma mark - 加载&上下拉刷新事件
/// 请求数据
- (void)loadNewData {}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

#pragma mark - getter setter
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end

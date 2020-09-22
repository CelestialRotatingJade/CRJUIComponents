//
//  CRJBaseHeaderFooterView.m
//  Pods
//
//  Created by zhuyuhui on 2020/9/18.
//

#import "CRJBaseHeaderFooterView.h"

@implementation CRJBaseHeaderFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        [self setupHeaderFooterView];
        [self buildSubview];
    }
    
    return self;
}

- (void)setHeaderFooterViewBackgroundColor:(UIColor *)color {
    
    self.contentView.backgroundColor = color;
}

- (void)setupHeaderFooterView {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

+ (CGFloat)heightWithData:(id)data {
    
    return 0;
}

+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier {
    
    NSString *identifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:identifier];
}

+ (void)registerToTableView:(UITableView *)tableView {
    
    [tableView registerClass:[self class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([self class])];
}


@end

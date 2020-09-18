//
//  CRJBaseCLVCell.m
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "CRJBaseCLVCell.h"

@implementation CRJBaseCLVCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)contentOffset:(CGPoint)offset {
    
}
#pragma mark - Useful method.
- (void)selectedEvent {
    
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier {

    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier.length ? reuseIdentifier : NSStringFromClass([self class])];
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView {

    [collectionView registerClass:[self class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}
@end

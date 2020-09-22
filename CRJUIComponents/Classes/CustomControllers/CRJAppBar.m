//
//  CRJAppBar.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "CRJAppBar.h"

@implementation CRJAppBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bgView = [[UIImageView alloc] init];
        self.bgView.userInteractionEnabled = YES;
        self.bgView.backgroundColor = [CRJAppearanceConfigure sharedInstance].topAppBarColor;
        
        self.navigationBar = [[UIView alloc] init];
        self.navigationBar.backgroundColor = [UIColor clearColor];
        
        self.leftBarContainers = [[UIView alloc] init];
        self.leftBarContainers.backgroundColor = [UIColor clearColor];

        self.rightBarContainers = [[UIView alloc] init];
        self.rightBarContainers.backgroundColor = [UIColor clearColor];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.text = @"";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [CRJAppearanceConfigure sharedInstance].topAppBarTextFont;
        self.titleLabel.textColor = [CRJAppearanceConfigure sharedInstance].topAppBarTextColor;
        
        self.divideLine = [[UIView alloc] init];
        self.divideLine.backgroundColor = [CRJAppearanceConfigure sharedInstance].dividerColor;

        [self addSubview:self.bgView];
        [self addSubview:self.navigationBar];
        [self addSubview:self.divideLine];
        
        [self.navigationBar addSubview:self.leftBarContainers];
        [self.navigationBar addSubview:self.rightBarContainers];
        [self.navigationBar addSubview:self.titleLabel];
    
        [self layout];
    }
    return self;
}


- (void)layout{
    [self.leftBarContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.rightBarContainers.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat navigationBarHeight = [CRJAppearanceConfigure sharedInstance].navigationBarHeight;;
    
    self.bgView.frame = CGRectMake(0, 0, self.width, self.height);
    self.navigationBar.frame = CGRectMake(0, self.height - navigationBarHeight, self.width, navigationBarHeight);
    self.divideLine.frame = CGRectMake(0, self.height - 0.5, self.width, 0.5);

    CGFloat leftBarContainersW = 0;
    CGFloat rightBarContainersW = 0;
    if (self.leftBarButtonItems) {
        for (UIView *item in self.leftBarButtonItems) {
            item.left = leftBarContainersW;
            item.height = self.navigationBar.height;
            leftBarContainersW += CGRectGetWidth(item.frame);
            [self.leftBarContainers addSubview:item];
        }
        
        if (@available(iOS 11.0, *)) {
            self.leftBarContainers.frame = CGRectMake(self.safeAreaInsets.left, 0, leftBarContainersW, self.navigationBar.height);
        } else {
            // Fallback on earlier versions
            self.leftBarContainers.frame = CGRectMake(0, 0, leftBarContainersW, self.navigationBar.height);
        }
    }
    
    if (self.rightBarButtonItems) {
        for (UIView *item in self.rightBarButtonItems) {
            item.left = rightBarContainersW;
            item.height = self.navigationBar.height;
            rightBarContainersW += CGRectGetWidth(item.frame);
            [self.rightBarContainers addSubview:item];
        }
        
        if (@available(iOS 11.0, *)) {
            self.rightBarContainers.frame = CGRectMake(self.width - rightBarContainersW - self.safeAreaInsets.right, 0, rightBarContainersW, self.navigationBar.height);
        } else {
            // Fallback on earlier versions
            self.rightBarContainers.frame = CGRectMake(self.width - rightBarContainersW, 0, rightBarContainersW, self.navigationBar.height);
        }
    }
    CGFloat maxBarContainersW = MAX(leftBarContainersW, rightBarContainersW);
    CGFloat titleLMax = self.width - maxBarContainersW * 2 - 12 * 2;
    
    self.titleLabel.frame = CGRectMake((self.width - titleLMax) / 2, 0, titleLMax, self.navigationBar.height);
}

-(void)setLeftBarButtonItems:(NSArray<UIView *> *)leftBarButtonItems{
    _leftBarButtonItems = leftBarButtonItems;
    [self layout];
}

- (void)setRightBarButtonItems:(NSArray<UIView *> *)rightBarButtonItems{
    _rightBarButtonItems = rightBarButtonItems;
    [self layout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layout];
}

@end

//
//  DLAnimationBottom.m
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import "DLAnimationBottom.h"

@implementation DLAnimationBottom
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
        self.contentWidthRatio = 1.0f;
        self.contentHeightRatio = 250.f / screenH;
    }
    return self;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BOOL isPresenting = (fromVC == self.presentingViewController);
    
    UIView *fromV = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toV = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *containerV = [transitionContext containerView];
    [containerV addSubview:toV];
    
    CGFloat screenH = CGRectGetHeight(containerV.bounds);
    CGFloat screenW = CGRectGetWidth(containerV.bounds);
    CGFloat height = screenH * self.contentHeightRatio;
    CGRect showFrame = CGRectMake(0, screenH - height, screenW, height);
    CGRect hiddenFrame = CGRectMake(0, screenH, screenW, height);
    
    if (isPresenting) toV.frame = hiddenFrame;

    [UIView animateWithDuration:self.transitionDuration delay:self.delay usingSpringWithDamping:self.dampingRatio initialSpringVelocity:self.velocity options:self.options animations:^{
        if (isPresenting) {
            toV.frame = showFrame;
        } else {
            fromV.frame = hiddenFrame;
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}
@end

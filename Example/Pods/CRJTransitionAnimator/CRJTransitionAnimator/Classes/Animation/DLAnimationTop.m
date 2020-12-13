#import "DLAnimationTop.h"

@implementation DLAnimationTop
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

        CGFloat kNavigationBarHeight = 44;
        CGFloat kTopUnSafeAreaHeight = [[self class] isFringeScreen] ? [[self class] fringeScreenTopSafeHeight] : 20;
        CGFloat height = kNavigationBarHeight + kTopUnSafeAreaHeight;
        self.contentHeightRatio = height / [UIScreen mainScreen].bounds.size.height;
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
    
    CGFloat screenW = CGRectGetWidth(containerV.bounds);
    CGFloat screenH = CGRectGetHeight(containerV.bounds);

    CGFloat height = screenH * self.contentHeightRatio;
    CGRect showFrame = CGRectMake(0, 0, screenW, height);
    CGRect hiddenFrame = CGRectMake(0, -height, screenW, height);
    
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

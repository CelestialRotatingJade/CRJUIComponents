#import "DLAnimationRight.h"

@implementation DLAnimationRight
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
        CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
        
        self.contentWidthRatio = 0.8;
    }
    return self;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BOOL isPresenting = (fromVC == self.presentingViewController);
    
    UIView *fromV = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toV = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *contrainerV = [transitionContext containerView];
    [contrainerV addSubview:toV];
    
    CGFloat screenWidth = CGRectGetWidth(contrainerV.bounds);
    CGFloat screenHeight = CGRectGetHeight(contrainerV.bounds);
    CGFloat width = screenWidth * self.contentWidthRatio;
    CGRect hiddenFrame = CGRectMake(screenWidth, 0, width, screenHeight);
    CGRect showFrame = CGRectMake(screenWidth - width, 0, width, screenHeight);
    
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

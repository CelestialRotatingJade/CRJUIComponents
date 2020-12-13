
#import "DLAnimationLeft.h"

@implementation DLAnimationLeft

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
    UIViewController *fromController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    BOOL isPresenting = (fromController == self.presentingViewController);
    
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    
    CGFloat screenWidth = CGRectGetWidth(containerView.bounds);
    CGFloat screenHeight = CGRectGetHeight(containerView.bounds);
    CGFloat width = screenWidth * self.contentWidthRatio;
    CGRect hiddenFrame = CGRectMake(-width, 0, width, screenHeight);
    CGRect showFrame = CGRectMake(0, 0, width, screenHeight);
    if (isPresenting) toView.frame = hiddenFrame;
    
    [UIView animateWithDuration:self.transitionDuration delay:self.delay usingSpringWithDamping:self.dampingRatio initialSpringVelocity:self.velocity options:self.options animations:^{
        if (isPresenting) {
            toView.frame = showFrame;
        } else {
            fromView.frame = hiddenFrame;
        }
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
}


@end

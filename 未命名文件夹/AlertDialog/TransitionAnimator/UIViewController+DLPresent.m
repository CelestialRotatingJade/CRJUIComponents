//
//  UIViewController+DLPresent.m
//  CRJTransitionAnimator
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "UIViewController+DLPresent.h"
#import "DLCustomPresentationController.h"
#import "AlertBaseDialog.h"

@implementation UIViewController (DLPresent)
- (void)presentViewController:(UIViewController *)viewControllerToPresent animation:(TransitionAnimator *)animation completion:(void (^)(void))completion {
    dispatch_async(dispatch_get_main_queue(), ^{
        DLCustomPresentationController *presentingVC = [[DLCustomPresentationController alloc] initWithPresentedViewController:viewControllerToPresent presentingViewController:self];
        viewControllerToPresent.transitioningDelegate = presentingVC;
        presentingVC.animation = animation;
        [self presentViewController:viewControllerToPresent animated:YES completion:completion];
    });
}
@end

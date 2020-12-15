//
//  UIViewController+DLPresent.h
//  CRJTransitionAnimator
//
//  Created by zhuyuhui on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimator.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DLPresent)
- (void)presentViewController:(UIViewController *)viewControllerToPresent animation:(TransitionAnimator *)animation completion:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END

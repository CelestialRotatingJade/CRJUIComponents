//
//  DLCustomPresentationController.h
//  CRJTransitionAnimator
//
//  Created by zhuyuhui on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimator.h"
NS_ASSUME_NONNULL_BEGIN

@interface DLCustomPresentationController : UIPresentationController<UIViewControllerTransitioningDelegate>
// 指定转场动画
@property(nonatomic, strong) TransitionAnimator * animation;
@end

NS_ASSUME_NONNULL_END

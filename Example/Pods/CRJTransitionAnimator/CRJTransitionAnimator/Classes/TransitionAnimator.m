//
//  TransitionAnimator.m
//  CRJTransitionAnimator
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "TransitionAnimator.h"

@interface TransitionAnimator ()

@end

@implementation TransitionAnimator

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.transitionDuration = 0.5f;
        self.delay = 0.0f;
        self.dampingRatio = 0.9f;
        self.velocity = 0.3f;
        self.options = UIViewAnimationOptionCurveEaseInOut;
        
        self.contentWidthRatio = 0.5;
        self.contentHeightRatio = 0.5;
    }
    
    return self;
}

- (void)transitionAnimation {

    [NSException raise:@"TransitionAnimator Error."
                format:@"You should overwrite this method in subclass."];
}

#pragma mark - Protocol UIViewControllerAnimatedTransitioning.

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {

    return self.transitionDuration;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
}

- (void)animationEnded:(BOOL) transitionCompleted {
    if (self.delegate && [self.delegate respondsToSelector:@selector(transitionAnimationEnded:)]) {
        [self.delegate transitionAnimationEnded:self];
    }
}






#pragma mark - Useful Method
//是否是刘海屏
+ (BOOL)isFringeScreen {
    BOOL isFringeScreen = NO;
    if (@available(iOS 11.0, *)) {
        UIWindow *mainWindow = [[[UIApplication sharedApplication] delegate] window];
        if (mainWindow.safeAreaInsets.bottom > 0.0) {
            isFringeScreen = YES;
        }
    }
    return isFringeScreen;
}
+ (UIEdgeInsets)safeAreaInsets {
    UIEdgeInsets areaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
        areaInsets = window.safeAreaInsets;
    }
    return areaInsets;
}

+ (CGFloat)fringeScreenTopSafeHeight {
    CGFloat height = 0;
    if ([self isFringeScreen]) {
        height = 44.f;
    }
    return height;
}

+ (CGFloat)fringeScreenBottomSafeHeight {
    CGFloat height = 0;
    if ([self isFringeScreen]) {
        height = 34.f;
    }
    return height;
}

@end

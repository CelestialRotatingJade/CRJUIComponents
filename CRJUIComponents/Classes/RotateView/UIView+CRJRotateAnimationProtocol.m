//
//  UIView+CRJRotateAnimationProtocol.m
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "UIView+CRJRotateAnimationProtocol.h"
#import <objc/runtime.h>

@implementation UIView (CRJRotateAnimationProtocol)
/**
 *  rotateDuration
 */
NSString * const _recognizerRotateDuration = @"_recognizerRotateDuration";
- (void)setCrjRotateDuration:(CGFloat)crjRotateDuration {
    NSNumber *value = @(crjRotateDuration);
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerRotateDuration),
                             value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)crjRotateDuration {
    NSNumber *value = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerRotateDuration));
    return [value floatValue];
}

/**
 *  defaultTransform
 */
NSString * const _recognizerDefaultTransform = @"_recognizerDefaultTransform";

- (void)setCrjDefaultTransform:(CGAffineTransform)crjDefaultTransform {
    
    NSValue *value = [NSValue valueWithCGAffineTransform:crjDefaultTransform];
    objc_setAssociatedObject(self, (__bridge const void *)(_recognizerDefaultTransform),
                             value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGAffineTransform)crjDefaultTransform {
    NSValue *value = objc_getAssociatedObject(self, (__bridge const void *)(_recognizerDefaultTransform));
    return [value CGAffineTransformValue];
}
@end

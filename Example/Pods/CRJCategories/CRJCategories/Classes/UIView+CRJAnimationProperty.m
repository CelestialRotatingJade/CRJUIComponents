//
//  UIView+CRJAnimationProperty.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJAnimationProperty.h"
#import <objc/runtime.h>

@implementation UIView (CRJAnimationProperty)

#pragma mark - Scale.

NSString * const _crj_recognizerScale = @"_crj_recognizerScale";
- (void)setCrj_scale:(CGFloat)crj_scale {
    objc_setAssociatedObject(self, (__bridge const void *)(_crj_recognizerScale), @(crj_scale), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeScale(crj_scale, crj_scale);
}

- (CGFloat)crj_scale {
    
    NSNumber *scaleValue = objc_getAssociatedObject(self, (__bridge const void *)(_crj_recognizerScale));
    return scaleValue.floatValue;
}

#pragma mark - Angle.

NSString * const _crj_recognizerAngle = @"_crj_recognizerAngle";
- (void)setCrj_angle:(CGFloat)crj_angle {
    objc_setAssociatedObject(self, (__bridge const void *)(_crj_recognizerAngle), @(crj_angle), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.transform = CGAffineTransformMakeRotation(crj_angle);
}

- (CGFloat)crj_angle{
    
    NSNumber *angleValue = objc_getAssociatedObject(self, (__bridge const void *)(_crj_recognizerAngle));
    return angleValue.floatValue;
}

@end

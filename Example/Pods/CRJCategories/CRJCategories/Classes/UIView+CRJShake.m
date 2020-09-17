//
//  UIView+CRJShake.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJShake.h"
#import <objc/runtime.h>

#define CRJ__HAS_OPT(options, option) ((options & option) == option)

@interface CRJ_SCShakeInfo : NSObject

@property (assign, nonatomic)   CGAffineTransform baseTransform;
@property (assign, nonatomic)   BOOL shaking;
@property (assign, nonatomic)   CRJ_SCShakeOptions options;
@property (assign, nonatomic)   CGFloat force;
@property (assign, nonatomic)   CGFloat duration;
@property (assign, nonatomic)   CGFloat iterationDuration;
@property (assign, nonatomic)   CFTimeInterval startTime;
@property (strong, nonatomic)   CRJ_ShakeCompletionHandler completionHandler;
@property (assign, nonatomic)   BOOL reversed;
@property (readonly, nonatomic) CGFloat completionRatio;

@end

@implementation CRJ_SCShakeInfo

- (CGFloat)completionRatio {
    
    return (CACurrentMediaTime() - self.startTime) / self.duration;
}

@end

@implementation UIView (CRJShake)

static const char *ShakeInfoKey = "ShakeInfo";

- (void)crj_shake {
    
    [self crj_shakeWithOptions:kCRJ_DefaultShakeOptions
                     force:kCRJ_DefaultShakeForce
                  duration:kCRJ_DefaultShakeDuration
         iterationDuration:kCRJ_DefaultShakeIterationDuration
         completionHandler:nil];
}

- (void)crj_shakeWithOptions:(CRJ_SCShakeOptions)shakeOptions
                   force:(CGFloat)force
                duration:(CGFloat)duration
       iterationDuration:(CGFloat)iterationDuration
       completionHandler:(CRJ_ShakeCompletionHandler)completionHandler {
    
    CRJ_SCShakeInfo *shakeInfo = [self shakeInfo];
    
    shakeInfo.options           = shakeOptions;
    shakeInfo.force             = force;
    shakeInfo.startTime         = CACurrentMediaTime();
    shakeInfo.duration          = duration;
    shakeInfo.iterationDuration = iterationDuration;
    shakeInfo.completionHandler = completionHandler;
    
    if (!shakeInfo.shaking) {
        
        shakeInfo.baseTransform = self.transform;
        shakeInfo.shaking       = YES;
        
        [self _doAnimation:1];
    }
}

- (CGFloat)_getInterpolationRatio:(CGFloat)completionRatio options:(CRJ_SCShakeOptions)options {
    
    CGFloat (*interpFunc)(CGFloat) = nil;
    
    if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsForceInterpolationRandom)) {
        
        interpFunc =& InterpolateRandom;
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsForceInterpolationExpDown)) {
        
        interpFunc =& InterpolateExpDown;
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsForceInterpolationExpUp)) {
        
        interpFunc =& InterpolateExpUp;
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsForceInterpolationLinearDown)) {
        
        interpFunc =& InterpolateLinearDown;
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsForceInterpolationLinearUp)) {
        
        interpFunc =& InterpolateLinearUp;
        
    } else {
        
        interpFunc =& InterpolateNone;
    }
    
    return interpFunc(completionRatio);
}

- (void)_animate:(CGFloat)force shakeInfo:(CRJ_SCShakeInfo *)shakeInfo {
    
    CGAffineTransform baseTransform = shakeInfo.baseTransform;
    CRJ_SCShakeOptions    options       = shakeInfo.options;
    
    if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsDirectionHorizontalAndVertical)) {
        
        if (arc4random_uniform(2) == 1) {
            
            self.transform = CGAffineTransformTranslate(baseTransform, 0, force * self.bounds.size.height);
            
        } else {
            
            self.transform = CGAffineTransformTranslate(baseTransform, force * self.bounds.size.width, 0);
        }
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsDirectionVertical)) {
        
        self.transform = CGAffineTransformTranslate(baseTransform, 0, force * self.bounds.size.height);
        
    } else if (CRJ__HAS_OPT(options, CRJ_SCShakeOptionsDirectionHorizontal)) {
        
        self.transform = CGAffineTransformTranslate(baseTransform, force * self.bounds.size.width, 0);
        
    } else {
        
        self.transform = CGAffineTransformRotate(baseTransform, force * M_PI_2);
    }
}

- (void)_doAnimation:(CGFloat)direction {
    
    CRJ_SCShakeInfo *shakeInfo  = [self shakeInfo];
    CRJ_SCShakeOptions options  = shakeInfo.options;
    CGFloat completionRatio = shakeInfo.completionRatio;
    
    if (completionRatio > 1) {
        
        completionRatio = 1;
    }
    
    if (shakeInfo.reversed) {
        
        completionRatio = 1 - completionRatio;
    }
    
    CGFloat interpolationRatio = [self _getInterpolationRatio:completionRatio options:options];
    CGFloat force              = shakeInfo.force * interpolationRatio * direction;
    CGFloat iterationDuration  = shakeInfo.iterationDuration;
    
    [UIView animateWithDuration:iterationDuration animations:^{
        
        [self _animate:force shakeInfo:shakeInfo];
        
    } completion:^(BOOL finished) {
        
        if (shakeInfo.shaking) {
            
            BOOL shouldRecurse = YES;
            if (shakeInfo.completionRatio > 1) {
                
                if (CRJ__HAS_OPT(shakeInfo.options, CRJ_SCShakeOptionsAutoreverse)) {
                    
                    shakeInfo.reversed = !shakeInfo.reversed;
                }
                
                if (shakeInfo.reversed || CRJ__HAS_OPT(shakeInfo.options, CRJ_SCShakeOptionsAtEndRestart)) {
                    
                    shakeInfo.startTime = CACurrentMediaTime();
                    
                } else if (!CRJ__HAS_OPT(shakeInfo.options, CRJ_SCShakeOptionsAtEndContinue)) {
                    
                    shouldRecurse = NO;
                    [self crj_endShake];
                }
            }
            
            if (shouldRecurse) {
                
                [self _doAnimation:direction * -1];
            }
        }
    }];
}

- (void)crj_endShake {
    
    CRJ_SCShakeInfo *shakeInfo = [self shakeInfo];
    
    if (shakeInfo.shaking) {
        
        shakeInfo.shaking                        = NO;
        self.transform                           = shakeInfo.baseTransform;
        CRJ_ShakeCompletionHandler completionHandler = shakeInfo.completionHandler;
        shakeInfo.completionHandler              = nil;
        
        if (completionHandler != nil) {
            
            completionHandler();
        }
    }
}

- (BOOL)crj_isShaking {
    return [self shakeInfo].shaking;
}

- (CRJ_SCShakeInfo *)shakeInfo {
    
    CRJ_SCShakeInfo *shakeInfo = objc_getAssociatedObject(self, ShakeInfoKey);
    
    if (shakeInfo == nil) {
        
        shakeInfo = [CRJ_SCShakeInfo new];
        objc_setAssociatedObject(self, ShakeInfoKey, shakeInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return shakeInfo;
}

#pragma Interpolations functions

static CGFloat InterpolateLinearUp(CGFloat input) {
    
    return input;
}

static CGFloat InterpolateLinearDown(CGFloat input) {
    
    return 1 - input;
}

static CGFloat Exp(CGFloat a, int power) {
    
    if (a < 0.5f) {
        
        return (float)pow(a * 2, power) / 2;
        
    } else {
    
        return (float)pow((a - 1) * 2, power) / (power % 2 == 0 ? -2 : 2) + 1;
    }
}

static CGFloat InterpolateExpUp(CGFloat input) {
    
    return Exp(input, 4);
}

static CGFloat InterpolateExpDown(CGFloat input) {
    
    return Exp(1 - input, 4);
}

static CGFloat InterpolateNone(CGFloat input) {
    
    return 1;
}

static CGFloat InterpolateRandom(CGFloat input) {
    
    CGFloat randNb = arc4random_uniform(10000);
    return randNb / 10000.0;
}

@end

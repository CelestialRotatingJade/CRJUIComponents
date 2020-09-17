//
//  UIView+CRJShake.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

// https://github.com/rFlex/SCViewShaker

#define kCRJ_DefaultShakeOptions  (CRJ_SCShakeOptionsDirectionHorizontal | CRJ_SCShakeOptionsForceInterpolationExpDown | CRJ_SCShakeOptionsAtEndComplete)
#define kCRJ_DefaultShakeForce    (0.075)
#define kCRJ_DefaultShakeDuration (0.5)
#define kCRJ_DefaultShakeIterationDuration (0.03)

typedef enum : NSUInteger {
    
    CRJ_SCShakeOptionsDirectionRotate                = 0,
    CRJ_SCShakeOptionsDirectionHorizontal            = 1,
    CRJ_SCShakeOptionsDirectionVertical              = 2,
    CRJ_SCShakeOptionsDirectionHorizontalAndVertical = 3,
    CRJ_SCShakeOptionsForceInterpolationNone         = 4,
    CRJ_SCShakeOptionsForceInterpolationLinearUp     = 8,
    CRJ_SCShakeOptionsForceInterpolationLinearDown   = 16,
    CRJ_SCShakeOptionsForceInterpolationExpUp        = 32,
    CRJ_SCShakeOptionsForceInterpolationExpDown      = 64,
    CRJ_SCShakeOptionsForceInterpolationRandom       = 128,
    CRJ_SCShakeOptionsAtEndRestart                   = 256,
    CRJ_SCShakeOptionsAtEndComplete                  = 512,
    CRJ_SCShakeOptionsAtEndContinue                  = 1024,
    CRJ_SCShakeOptionsAutoreverse                    = 2048
    
} CRJ_SCShakeOptions;

typedef void(^CRJ_ShakeCompletionHandler)(void);

@interface UIView (CRJShake)

/**
 *  Returns whether the view is currently shaking or not.
 */
@property (readonly, nonatomic) BOOL crj_isShaking;

/**
 *  Shake the view using the default options. The view will be shaken for a short amount of time.
 */
- (void)crj_shake;

/*
 Shake the view using the specified options.
 |shakeOptions| is an enum of options that can be activated by using the OR operator (like CRJ_SCShakeOptionsDirectionRotate | CRJ_SCShakeOptionsForceInterpolationNone).
 
 |force| is the coefficient of force to apply on each shake iteration (typically between 0 and 1 even though nothing prevents you for setting a higher value if you want).
 
 |duration| is the total duration of the shaking motion. This may be ignored depending of the options you set.
 iterationDuration is how long each shake iteration will last. You may want to set a very low value (like 0.02) if you want a proper shake effect.
 
 |completionHandler|, if not null, is the block that will be invoked when the shake finishes.
 */
- (void)crj_shakeWithOptions:(CRJ_SCShakeOptions)shakeOptions
                   force:(CGFloat)force duration:(CGFloat)duration
       iterationDuration:(CGFloat)iterationDuration
       completionHandler:(nullable CRJ_ShakeCompletionHandler)completionHandler;

/**
 *  End the current shaking action, if any
 */
- (void)crj_endShake;

@end

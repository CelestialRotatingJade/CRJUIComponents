//
//  UIView+CRJAnimationPracticalMethod.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJAnimationPracticalMethod)
/**
 *  Set the view's alpha.
 *
 *  @param alpha    Alpha.
 *  @param duration Animation's duration.
 *  @param animated Animated or not.
 */
- (void)crj_alpha:(CGFloat)alpha duration:(NSTimeInterval)duration animated:(BOOL)animated;

@end

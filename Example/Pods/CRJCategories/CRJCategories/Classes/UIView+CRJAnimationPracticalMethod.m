//
//  UIView+CRJAnimationPracticalMethod.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJAnimationPracticalMethod.h"

@implementation UIView (CRJAnimationPracticalMethod)
- (void)crj_alpha:(CGFloat)alpha duration:(NSTimeInterval)duration animated:(BOOL)animated {

    CGFloat effectiveAlpha = (alpha < 0 || alpha > 1) ? (alpha < 0 ? 0 : 1) : alpha;
    
    if (animated) {
        
        [UIView animateWithDuration:duration animations:^{
            
            self.alpha = effectiveAlpha;
        }];
        
    } else {
    
        self.alpha = alpha;
    }
}
@end

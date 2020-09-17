//
//  CRJRotateView.m
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "CRJRotateView.h"

@implementation CRJRotateView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.crjDefaultTransform = self.transform;
    }
    
    return self;
}

#pragma mark - 动画的执行
- (void)changeToUpAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:(self.crjRotateDuration > 0 ? self.crjRotateDuration : 0.5f)
                         animations:^{
                             
                             self.transform = self.crjDefaultTransform;
                         }];
    } else {
        
        self.transform = self.crjDefaultTransform;
    }
    
}
- (void)changeToLeftAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:(self.crjRotateDuration > 0 ? self.crjRotateDuration : 0.5f)
                         animations:^{
                             
                             self.transform = CGAffineTransformRotate(self.crjDefaultTransform, -M_PI_2);
                         }];
    } else {
        
        self.transform = CGAffineTransformRotate(self.crjDefaultTransform, -M_PI_2);
    }
}
- (void)changeToRightAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:(self.crjRotateDuration > 0 ? self.crjRotateDuration : 0.5f)
                         animations:^{
                             
                             self.transform = CGAffineTransformRotate(self.crjDefaultTransform, M_PI_2);
                         }];
    } else {
        
        self.transform = CGAffineTransformRotate(self.crjDefaultTransform, M_PI_2);
    }
}
- (void)changeToDownAnimated:(BOOL)animated {
    
    if (animated) {
        
        [UIView animateWithDuration:(self.crjRotateDuration > 0 ? self.crjRotateDuration : 0.5f)
                         animations:^{
                             
                             self.transform = CGAffineTransformRotate(self.crjDefaultTransform, M_PI);
                         }];
    } else {
        
        self.transform = CGAffineTransformRotate(self.crjDefaultTransform, M_PI);
    }
}

@end

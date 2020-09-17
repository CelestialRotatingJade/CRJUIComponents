//
//  UIView+CRJUserInteraction.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJUserInteraction.h"

#import <objc/runtime.h>

@interface UIView ()

@property (nonatomic, strong) NSNumber  *crj_userInteractionNumbers;

@end

@implementation UIView (CRJUserInteraction)

- (void)crj_enabledUserInteraction {
    
    [self accessUserInteractionNumbers];
    
    self.crj_userInteractionNumbers = @(self.crj_userInteractionNumbers.integerValue + 1);
    
    [self accessUserInteraction];
}

- (void)crj_disableUserInteraction {
    
    [self accessUserInteractionNumbers];
    
    self.crj_userInteractionNumbers = @(self.crj_userInteractionNumbers.integerValue - 1);
    
    [self accessUserInteraction];
}

- (void)accessUserInteractionNumbers {
    
    if (self.crj_userInteractionNumbers == nil) {
        
        self.crj_userInteractionNumbers = @(0);
    }
}

- (void)accessUserInteraction {

    if (self.crj_userInteractionNumbers.integerValue > 0) {
        
        self.userInteractionEnabled = YES;
        
    } else {
        
        self.userInteractionEnabled = NO;
    }
}

- (void)setCrj_userInteractionNumbers:(NSNumber *)crj_userInteractionNumbers{
    objc_setAssociatedObject(self, @selector(crj_userInteractionNumbers), crj_userInteractionNumbers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSNumber *)crj_userInteractionNumbers{
    return objc_getAssociatedObject(self, _cmd);
}

@end


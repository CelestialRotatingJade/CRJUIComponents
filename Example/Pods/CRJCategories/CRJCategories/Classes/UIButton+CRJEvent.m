//
//  UIButton+CRJEvent.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIButton+CRJEvent.h"
#import <objc/runtime.h>

@interface UIButton ()

@property (nonatomic, copy) CRJButtonEvent_t crj_buttonEventBlock;

@end

@implementation UIButton (CRJEvent)

- (void)crj_blockEvent:(CRJButtonEvent_t)block {
    
    self.crj_buttonEventBlock = block;
    
    if (self.crj_buttonEventBlock) {
        
        [self addTarget:self action:@selector(blockTouchUpInSideEvent:) forControlEvents:UIControlEventTouchUpInside];
        
    } else {
        
        [self removeTarget:self action:@selector(blockTouchUpInSideEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)blockTouchUpInSideEvent:(UIButton *)button {
    
    if (self.crj_buttonEventBlock) {
        
        self.crj_buttonEventBlock(button);
    }
}

+ (UIButton *)crj_buttonWithFrame:(CGRect)frame
                     configBlock:(void (^)(UIButton *button))configBlock
                      eventBlock:(CRJButtonEvent_t)eventBlock {
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    configBlock ? configBlock(button) : 0;
    [button crj_blockEvent:eventBlock];
    
    return button;
}

#pragma mark - Setter & Getter.
- (void)setCrj_buttonEventBlock:(CRJButtonEvent_t)crj_buttonEventBlock {
    objc_setAssociatedObject(self, @selector(crj_buttonEventBlock), crj_buttonEventBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (CRJButtonEvent_t)crj_buttonEventBlock {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end

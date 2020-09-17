//
//  UIView+CRJTrash.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJTrash.h"

@implementation UIView (CRJTrash)
- (UIEdgeInsets)crj_safeAreaInsets {
    if (@available(iOS 11.0, *)) {
        return self.safeAreaInsets;
    }
    return UIEdgeInsetsZero;
}

- (void)crj_borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = [borderColor CGColor];
}
@end

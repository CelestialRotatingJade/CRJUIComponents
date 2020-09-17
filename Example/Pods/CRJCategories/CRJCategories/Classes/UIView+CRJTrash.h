//
//  UIView+CRJTrash.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJTrash)

@property(nonatomic, assign, readonly) UIEdgeInsets crj_safeAreaInsets;

- (void)crj_borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

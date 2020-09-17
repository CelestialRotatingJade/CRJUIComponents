//
//  UIView+CRJConvenientMethod.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJConvenientMethod)

/**
 *  Create Line view.
 *
 *  @param frame Frame
 *  @param color Color
 *
 *  @return Line View.
 */
+ (UIView *)crj_lineViewWithFrame:(CGRect)frame color:(UIColor *)color;

/**
 *  Create Line view.
 *
 *  @param frame Frame
 *  @param color Color
 *  @param tag   Tag
 *
 *  @return Line View.
 */
+ (UIView *)crj_lineViewWithFrame:(CGRect)frame color:(UIColor *)color tag:(NSInteger)tag;

@end

//
//  UIView+CRJConvenientMethod.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJConvenientMethod.h"

@implementation UIView (CRJConvenientMethod)
+ (UIView *)crj_lineViewWithFrame:(CGRect)frame color:(UIColor *)color {
    
    UIView *line         = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    
    return line;
}

+ (UIView *)crj_lineViewWithFrame:(CGRect)frame color:(UIColor *)color tag:(NSInteger)tag {

    UIView *line         = [[UIView alloc] initWithFrame:frame];
    line.backgroundColor = color;
    line.tag             = tag;
    
    return line;
}
@end

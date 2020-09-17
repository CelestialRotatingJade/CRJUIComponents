
//
//  UIButton+CRJInit.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIButton+CRJInit.h"

@implementation UIButton (CRJInit)
#pragma mark - TitleLabel Alignment

- (void)crj_titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                        verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                        contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets {
    
    self.contentHorizontalAlignment = horizontalAlignment;
    self.contentVerticalAlignment   = verticalAlignment;
    self.contentEdgeInsets          = contentEdgeInsets;
}

#pragma mark - Target.action

- (instancetype)crj_addTarget:(id)target action:(SEL)action {
    
    [self addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return self;
}

#pragma mark - Title Color

- (void)crj_setNormalTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateNormal];
}

- (UIColor *)crj_normalTitleColor {
    
    return [self titleColorForState:UIControlStateNormal];
}

- (void)crj_setHighlightedTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateHighlighted];
}

- (UIColor *)crj_highlightedTitleColor {
    
    return [self titleColorForState:UIControlStateHighlighted];
}

- (void)crj_setDisabledTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateDisabled];
}

- (UIColor *)crj_disabledTitleColor {
    
    return [self titleColorForState:UIControlStateDisabled];
}

- (void)crj_setSelectedTitleColor:(UIColor *)color {
    
    [self setTitleColor:color forState:UIControlStateSelected];
}

- (UIColor *)crj_selectedTitleColor {
    
    return [self titleColorForState:UIControlStateSelected];
}

#pragma mark - Title

- (void)crj_setNormalTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateNormal];
}

- (NSString *)crj_normalTitle {
    
    return [self titleForState:UIControlStateNormal];
}

- (void)crj_setHighlightedTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateHighlighted];
}

- (NSString *)crj_highlightedTitle {
    
    return [self titleForState:UIControlStateHighlighted];
}

- (void)crj_setDisabledTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateDisabled];
}

- (NSString *)crj_disabledTitle {
    
    return [self titleForState:UIControlStateDisabled];
}

- (void)crj_setSelectedTitle:(NSString *)title {
    
    [self setTitle:title forState:UIControlStateSelected];
}

- (NSString *)crj_selectedTitle {
    
    return [self titleForState:UIControlStateSelected];
}

#pragma mark - Image

- (void)crj_setHighlightedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)crj_highlightedImage {
    
    return [self imageForState:UIControlStateHighlighted];
}

- (void)crj_setSelectedImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateSelected];
}

- (UIImage *)crj_selectedImage {
    
    return [self imageForState:UIControlStateSelected];
}

- (void)crj_setNormalImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateNormal];
}

- (UIImage *)crj_normalImage {
    
    return [self imageForState:UIControlStateNormal];
}

- (void)crj_setDisabledImage:(UIImage *)image {
    
    [self setImage:image forState:UIControlStateDisabled];
}

- (UIImage *)crj_disabledImage {
    
    return [self imageForState:UIControlStateDisabled];
}

#pragma mark - BackgroundImage

- (void)crj_setBackgroundNormalImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (UIImage *)crj_backgroundNormalImage {
    
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)crj_setBackgroundHighlightedImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (UIImage *)crj_backgroundHighlightedImage {
    
    return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)crj_setBackgroundDisabledImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateDisabled];
}

- (UIImage *)crj_backgroundDisabledImage {
    
    return [self backgroundImageForState:UIControlStateDisabled];
}

- (void)crj_setBackgroundSelectedImage:(UIImage *)image {
    
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

- (UIImage *)crj_backgroundSelectedImage {
    
    return [self backgroundImageForState:UIControlStateSelected];
}
@end

//
//  UIButton+CRJInit.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CRJInit)

#pragma mark - TitleLabel Alignment

- (void)crj_titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                        verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                        contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets;

#pragma mark - Title Color

- (void)crj_setNormalTitleColor:(UIColor *)color;
- (UIColor *)crj_normalTitleColor;

- (void)crj_setHighlightedTitleColor:(UIColor *)color;
- (UIColor *)crj_highlightedTitleColor;

- (void)crj_setDisabledTitleColor:(UIColor *)color;
- (UIColor *)crj_disabledTitleColor;

- (void)crj_setSelectedTitleColor:(UIColor *)color;
- (UIColor *)crj_selectedTitleColor;

#pragma mark - Target.action

- (instancetype)crj_addTarget:(id)target action:(SEL)action;

#pragma mark - Title

- (void)crj_setNormalTitle:(NSString *)title;
- (NSString *)crj_normalTitle;

- (void)crj_setHighlightedTitle:(NSString *)title;
- (NSString *)crj_highlightedTitle;

- (void)crj_setDisabledTitle:(NSString *)title;
- (NSString *)crj_disabledTitle;

- (void)crj_setSelectedTitle:(NSString *)title;
- (NSString *)crj_selectedTitle;

#pragma mark - Image

- (void)crj_setNormalImage:(UIImage *)image;
- (UIImage *)crj_normalImage;

- (void)crj_setHighlightedImage:(UIImage *)image;
- (UIImage *)crj_highlightedImage;

- (void)crj_setDisabledImage:(UIImage *)image;
- (UIImage *)crj_disabledImage;

- (void)crj_setSelectedImage:(UIImage *)image;
- (UIImage *)crj_selectedImage;

#pragma mark - BackgroundImage

- (void)crj_setBackgroundNormalImage:(UIImage *)image;
- (UIImage *)crj_backgroundNormalImage;

- (void)crj_setBackgroundHighlightedImage:(UIImage *)image;
- (UIImage *)crj_backgroundHighlightedImage;

- (void)crj_setBackgroundDisabledImage:(UIImage *)image;
- (UIImage *)crj_backgroundDisabledImage;

- (void)crj_setBackgroundSelectedImage:(UIImage *)image;
- (UIImage *)crj_backgroundSelectedImage;

@end

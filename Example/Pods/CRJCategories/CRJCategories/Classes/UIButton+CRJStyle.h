//
//  UIButton+CRJStyle.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CRJStyle)

/**
 *  Set the titleLabel's alignment.
 *
 *  @param horizontalAlignment UIControlContentHorizontalAlignment's value.
 *  @param verticalAlignment   UIControlContentVerticalAlignment's value.
 *  @param contentEdgeInsets   UIEdgeInsets value.
 */
- (void)crj_titleLabelHorizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                       verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                       contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets;

/**
 *  Set the titleLabel different state's color.
 *
 *  @param normalStateColor      Normal state color.
 *  @param highlightedStateColor Highlighted state color.
 *  @param disabledStateColor    Disabled state color.
 */
- (void)crj_titleLabelColorWithNormalStateColor:(UIColor *)normalStateColor
                         highlightedStateColor:(UIColor *)highlightedStateColor
                            disabledStateColor:(UIColor *)disabledStateColor;

/**
 *  Set the button's solod backgroundColor.
 *
 *  @param normalStateColor      Normal state color.
 *  @param highlightedStateColor Highlighted state color.
 *  @param disabledStateColor    Disabled state color.
 */
- (void)crj_buttonSolidBackgroundColorWithNormalStateColor:(UIColor *)normalStateColor
                                    highlightedStateColor:(UIColor *)highlightedStateColor
                                       disabledStateColor:(UIColor *)disabledStateColor;

/**
 *  Create Label button.
 *
 *  @param frame                 Frame.
 *  @param title                 Title.
 *  @param font                  Font.
 *  @param horizontalAlignment   HorizontalAlignment.
 *  @param verticalAlignment     VerticalAlignment.
 *  @param contentEdgeInsets     ContentEdgeInsets.
 *  @param target                Target.
 *  @param action                Action.
 *  @param normalStateColor      NormalStateColor.
 *  @param highlightedStateColor HighlightedStateColor.
 *  @param disabledStateColor    DisabledStateColor.
 *
 *  @return Label button.
 */
+ (UIButton *)crj_labelButtonWithFrame:(CGRect)frame
                                title:(NSString *)title
                                 font:(UIFont *)font
                  horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                    verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                    contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                               target:(id)target
                               action:(SEL)action
                     normalTitleColor:(UIColor *)normalStateColor
                highlightedTitleColor:(UIColor *)highlightedStateColor
                   disabledTitleColor:(UIColor *)disabledStateColor;

/**
 *  Create icon button.
 *
 *  @param frame               Frame.
 *  @param horizontalAlignment HorizontalAlignment.
 *  @param verticalAlignment   VerticalAlignment.
 *  @param contentEdgeInsets   ContentEdgeInsets
 *  @param target              Target.
 *  @param action              Action.
 *  @param normalImage         NormalImage.
 *  @param highlightImage      HighlightImage.
 *  @param disabledImage       DisabledImage.
 *
 *  @return button.
 */
+ (UIButton *)crj_iconButtonWithFrame:(CGRect)frame
                 horizontalAlignment:(UIControlContentHorizontalAlignment)horizontalAlignment
                   verticalAlignment:(UIControlContentVerticalAlignment)verticalAlignment
                   contentEdgeInsets:(UIEdgeInsets)contentEdgeInsets
                              target:(id)target
                              action:(SEL)action
                         normalImage:(UIImage *)normalImage
                      highlightImage:(UIImage *)highlightImage
                       disabledImage:(UIImage *)disabledImage;


@end

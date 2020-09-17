//
//  NSAttributedString+CRJSize.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@interface NSAttributedString (CRJSize)
/**
 *  Get the string's height with the fixed width.
 *
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)crj_heightWithFixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @return String's width.
 */
- (CGFloat)crj_width;

/**
 *  Get the coreText string's width.
 *
 *  @return String's width.
 */
- (CGFloat)crj_coreTextHeightWithFixedWidth:(CGFloat)width;
@end

@interface NSString (CRJSize)

#pragma mark - StringAttribute.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)crj_heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
- (CGFloat)crj_widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

/**
 *  Get a line of text height.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)crj_oneLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

#pragma mark - Font.

/**
 *  Get the string's height with the fixed width.
 *
 *  @param font  String's font.
 *  @param width Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)crj_heightWithStringFont:(UIFont *)font fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
- (CGFloat)crj_widthWithStringFont:(UIFont *)font;

/**
 *  Get a line of text height.
 *
 *  @param font  String's font.
 *
 *  @return String's width.
 */
+ (CGFloat)crj_oneLineOfTextHeightWithStringFont:(UIFont *)font;

@end

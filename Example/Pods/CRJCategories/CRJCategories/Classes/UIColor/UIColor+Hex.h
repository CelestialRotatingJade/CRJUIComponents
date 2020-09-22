//
//  UIColor+Hex.h
//  Animations
//
//  Created by YouXianMing on 2017/12/30.
//  Copyright © 2017年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 Get Hex value from color.

 @return The hex string value.
 */
- (NSString *)representInHex;

@end

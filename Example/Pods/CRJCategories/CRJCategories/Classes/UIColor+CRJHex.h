//
//  UIColor+CRJHex.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIColor (CRJHex)
+ (UIColor *)crj_colorWithHexString:(NSString *)color;
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)crj_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

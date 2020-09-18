//
//  CRJRoundingCornerView.h
//  CRJUIComponents_Example
//
//  Created by zhuyuhui on 2020/9/18.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CRJRoundingCornerView : UIView
/**
 A bitmask value that identifies the corners that you want rounded. You can use this parameter to round only a subset of the corners of the rectangle, default value is UIRectCornerAllCorners.
 */
@property (nonatomic) UIRectCorner rectCorner;

/**
 The radius of each corner oval. Values larger than half the rectangle’s width or height are clamped appropriately to half the width or height, default value is CGSizeZero.
 */
@property (nonatomic) CGSize cornerRadii;
@end


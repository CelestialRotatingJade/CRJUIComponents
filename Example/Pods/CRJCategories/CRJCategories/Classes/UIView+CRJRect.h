//
//  UIView+CRJRect.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJRect)
// Frame
@property (nonatomic) CGPoint crj_viewOrigin;
@property (nonatomic) CGSize  crj_viewSize;

// Frame Origin
@property (nonatomic) CGFloat crj_x;
@property (nonatomic) CGFloat crj_y;

// Frame Size
@property (nonatomic) CGFloat crj_width;
@property (nonatomic) CGFloat crj_height;

// Frame Borders
@property (nonatomic) CGFloat crj_top;
@property (nonatomic) CGFloat crj_left;
@property (nonatomic) CGFloat crj_bottom;
@property (nonatomic) CGFloat crj_right;

// Center Point
@property (nonatomic) CGFloat crj_centerX;
@property (nonatomic) CGFloat crj_centerY;

// Middle Point
@property (nonatomic, readonly) CGPoint crj_middlePoint;
@property (nonatomic, readonly) CGFloat crj_middleX;
@property (nonatomic, readonly) CGFloat crj_middleY;
@end

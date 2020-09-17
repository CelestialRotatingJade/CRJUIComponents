//
//  UIView+CRJRect.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIView+CRJRect.h"

@implementation UIView (CRJRect)
#pragma mark Frame

- (CGPoint)crj_viewOrigin {
    return self.frame.origin;
}

- (void)setCrj_viewOrigin:(CGPoint)crj_viewOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = crj_viewOrigin;
    self.frame      = newFrame;
}

- (CGSize)crj_viewSize {
    return self.frame.size;
}

- (void)setCrj_viewSize:(CGSize)crj_viewSize {
    CGRect newFrame = self.frame;
    newFrame.size   = crj_viewSize;
    self.frame      = newFrame;
}

#pragma mark Frame Origin

- (CGFloat)crj_x {
    return self.frame.origin.x;
}

- (void)setCrj_x:(CGFloat)crj_x {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = crj_x;
    self.frame        = newFrame;
}

- (CGFloat)crj_y {
    return self.frame.origin.y;
}

- (void)setCrj_y:(CGFloat)crj_y {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = crj_y;
    self.frame        = newFrame;
}

#pragma mark Frame Size

- (CGFloat)crj_height {
    return CGRectGetHeight(self.bounds);
}

- (void)setCrj_height:(CGFloat)crj_height {
    CGRect newFrame      = self.frame;
    newFrame.size.height = crj_height;
    self.frame           = newFrame;
}

- (CGFloat)crj_width {
    return CGRectGetWidth(self.bounds);
}

- (void)setCrj_width:(CGFloat)crj_width {
    CGRect newFrame     = self.frame;
    newFrame.size.width = crj_width;
    self.frame          = newFrame;
}

#pragma mark Frame Borders

- (CGFloat)crj_left {
    return self.frame.origin.x;
}

- (void)setCrj_left:(CGFloat)crj_left {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = crj_left;
    self.frame        = newFrame;
}

- (CGFloat)crj_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCrj_right:(CGFloat)crj_right {
    CGRect newFrame   = self.frame;
    newFrame.origin.x = crj_right - self.frame.size.width;
    self.frame        = newFrame;
}

- (CGFloat)crj_top {
    return self.frame.origin.y;
}

- (void)setCrj_top:(CGFloat)crj_top {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = crj_top;
    self.frame        = newFrame;
}

- (CGFloat)crj_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCrj_bottom:(CGFloat)crj_bottom {
    CGRect newFrame   = self.frame;
    newFrame.origin.y = crj_bottom - self.frame.size.height;
    self.frame        = newFrame;
}

#pragma mark Center Point

- (CGFloat)crj_centerX {
    
    return self.center.x;
}

- (void)setCrj_centerX:(CGFloat)crj_centerX {
    CGPoint newCenter = self.center;
    newCenter.x       = crj_centerX;
    self.center       = newCenter;
}

- (CGFloat)crj_centerY {
    
    return self.center.y;
}

- (void)setCrj_centerY:(CGFloat)crj_centerY {
    CGPoint newCenter = self.center;
    newCenter.y       = crj_centerY;
    self.center       = newCenter;
}

#pragma mark Middle Point

- (CGPoint)crj_middlePoint {
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

- (CGFloat)crj_middleX {
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)crj_middleY {
    return CGRectGetHeight(self.bounds) / 2.f;
}

@end

//
//  CALayer+CRJRect.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CALayer+CRJRect.h"

@implementation CALayer (CRJRect)
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
    
    return self.frame.size.height;
}

- (void)setCrj_height:(CGFloat)crj_height {
    CGRect newFrame      = self.frame;
    newFrame.size.height = crj_height;
    self.frame           = newFrame;
}

- (CGFloat)crj_width {
    
    return self.frame.size.width;
}

- (void)setCrj_width:(CGFloat)crj_width {
    CGRect newFrame     = self.frame;
    newFrame.size.width = crj_width;
    self.frame          = newFrame;
}

#pragma mark Frame Borders

- (CGFloat)crj_left {
    
    return self.crj_x;
}

- (void)setCrj_left:(CGFloat)crj_left {
    self.crj_x = crj_left;
}

- (CGFloat)crj_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setCrj_right:(CGFloat)crj_right {
    self.crj_x = crj_right - self.crj_width;
}

- (CGFloat)crj_top {
    
    return self.crj_y;
}

- (void)setCrj_top:(CGFloat)crj_top {
    self.crj_y = crj_top;
}

- (CGFloat)crj_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setCrj_bottom:(CGFloat)crj_bottom {
    self.crj_y = crj_bottom - self.crj_height;
}

#pragma mark Center Point

#if !IS_IOS_DEVICE
- (CGPoint)crj_center {
    
    return CGPointMake(self.crj_left + self.crj_middleX, self.crj_top + self.crj_middleY);
}

- (void)setCrj_center:(CGPoint)crj_center {
    self.crj_left = crj_center.x - self.crj_middleX;
    self.crj_top  = crj_center.y - self.crj_middleY;
}
#endif

- (CGFloat)crj_centerX {
    
    return self.crj_center.x;
}

- (void)setCrj_centerX:(CGFloat)crj_centerX {
    self.crj_center = CGPointMake(crj_centerX, self.crj_center.y);
}

- (CGFloat)crj_centerY {
    
    return self.crj_center.y;
}

- (void)setCrj_centerY:(CGFloat)crj_centerY {
    self.crj_center = CGPointMake(self.crj_center.x, crj_centerY);
}

#pragma mark Middle Point

- (CGPoint)crj_middlePoint {
    
    return CGPointMake(self.crj_middleX, self.crj_middleY);
}

- (CGFloat)crj_middleX {
    
    return self.crj_width / 2;
}

- (CGFloat)crj_middleY {
    
    return self.crj_height / 2;
}

@end

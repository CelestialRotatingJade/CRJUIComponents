//
//  CRJRoundingCornerView.m
//  CRJUIComponents_Example
//
//  Created by zhuyuhui on 2020/9/18.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJRoundingCornerView.h"

@interface CRJRoundingCornerView ()

@property (nonatomic, strong) CAShapeLayer *bgLayer;

@end

@implementation CRJRoundingCornerView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self buildBgLayer];
    }
    
    return self;
}

- (instancetype)init {
    
    if (self = [super init]) {
        
        [self buildBgLayer];
    }
 
    return self;
}

- (void)buildBgLayer {
    
    self.rectCorner  = UIRectCornerAllCorners;
    self.cornerRadii = CGSizeZero;
    
    self.bgLayer = [[CAShapeLayer alloc] init];
    [self updatePath];
    
    self.layer.mask = self.bgLayer;
}

- (void)updatePath {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:self.rectCorner cornerRadii:self.cornerRadii];
    
    self.bgLayer.frame = self.bounds;
    self.bgLayer.path  = maskPath.CGPath;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    [self updatePath];
}

#pragma mark - Setter

- (void)setRectCorner:(UIRectCorner)rectCorner {
    
    _rectCorner = rectCorner;
    
    [self updatePath];
}

- (void)setCornerRadii:(CGSize)cornerRadii {
    
    _cornerRadii = cornerRadii;
    
    [self updatePath];
}

@end


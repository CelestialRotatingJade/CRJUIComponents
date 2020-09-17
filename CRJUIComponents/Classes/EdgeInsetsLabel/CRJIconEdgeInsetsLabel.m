//
//  CRJIconEdgeInsetsLabel.m
//  CRJEdgeInsetsLabel
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "CRJIconEdgeInsetsLabel.h"

@interface CRJIconEdgeInsetsLabel ()

@property (nonatomic, weak) UIView  *oldIconView;

@end

@implementation CRJIconEdgeInsetsLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    UIEdgeInsets insets = self.edgeInsets;
    
    CGRect rect = [super textRectForBounds:UIEdgeInsetsInsetRect(bounds, insets) limitedToNumberOfLines:numberOfLines];
    
    rect.origin.x    -= insets.left;
    rect.origin.y    -= insets.top;
    rect.size.height += (insets.top + insets.bottom);
    _iconView && [_iconView isKindOfClass:[UIView class]] ?
    (rect.size.width += (insets.left + insets.right + _gap + _iconView.frame.size.width)) :
    (rect.size.width += (insets.left + insets.right));

    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    
    UIEdgeInsets insets = self.edgeInsets;
    
    if (self.iconView) {
        
        if (self.direction == CRJIconAtLeft) {

            _iconView.crj_left    = insets.left;
            _iconView.crj_centerY = self.crj_middleY;
            insets = UIEdgeInsetsMake(insets.top, insets.left + _gap + _iconView.frame.size.width, insets.bottom, insets.right);
            
        } else if (self.direction == CRJIconAtRight) {
        
            _iconView.crj_right   = self.crj_width - insets.right;
            _iconView.crj_centerY = self.crj_middleY;
            insets = UIEdgeInsetsMake(insets.top, insets.left, insets.bottom, insets.right  + _gap + _iconView.frame.size.width);
        }
    }
    
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

- (void)sizeToFitWithText:(NSString *)text {

    self.text = text;
    [self sizeToFit];
}

#pragma mark - setter & getter.

@synthesize iconView = _iconView;

- (void)setIconView:(UIView *)iconView {

    _oldIconView && [_oldIconView isKindOfClass:[UIView class]] ? ([_oldIconView removeFromSuperview]) : 0;
    
    _iconView    = iconView;
    _oldIconView = iconView;
    
    [self addSubview:iconView];
}

- (UIView *)iconView {

    return _iconView;
}

@end


//
//  CRJBadgeValueView.m
//  CRJBadgeValueView_Example
//
//  Created by zhuyuhui on 2020/9/6.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJBadgeValueView.h"

@interface CRJBadgeValueView ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation CRJBadgeValueView

- (instancetype)init {
    
    if (self = [super init]) {
    
        self.sensitiveWidth     = 10;
        self.fixedHeight        = 20;
        self.position           = CRJBadgePositionTopRight;
        self.font               = [UIFont systemFontOfSize:12.f];
        self.textColor          = [UIColor whiteColor];
        self.badgeColor         = [UIColor redColor];
    }
    
    return self;
}

- (void)makeEffect {

    // 标签
    self.label               = [[UILabel alloc] init];
    self.label.textColor     = self.textColor;
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font          = self.font;
    [self addSubview:self.label];
    
    // 背景色
    self.backgroundColor     = self.badgeColor;
    self.crj_width               = self.fixedHeight;
    self.crj_height              = self.fixedHeight;
    self.layer.cornerRadius  = self.fixedHeight / 2.f;
    self.layer.masksToBounds = YES;
    
    [_contentView addSubview:self];
}

- (void)setBadgeValue:(NSString *)badgeValue animated:(BOOL)animated {

    _badgeValue = badgeValue;
    
    // 是否执行动画
    if (animated) {
        
        [UIView animateWithDuration:0.15f animations:^{
            
            self.alpha = badgeValue.length == 0 ? 0 : 1;
        }];
        
    } else {
    
        self.alpha = badgeValue.length == 0 ? 0 : 1;
    }
    
    // 如果值为空，则不执行后续操作
    if (badgeValue.length <= 0) {
        
        return;
    }
    
    // 设置文本
    self.label.text = badgeValue;
    [self.label sizeToFit];

    
    // 更新尺寸
    if (self.label.crj_width + self.sensitiveWidth > self.crj_width) {
        
        self.crj_width = self.label.crj_width + self.sensitiveWidth;
        
    } else {
        
        self.crj_width = self.fixedHeight;
    }
    
    // 更新文本尺寸
    self.label.center = self.crj_middlePoint;
    
    

    // 根据位置更新尺寸
    CGFloat offset = self.fixedHeight / 2.f;
    switch (self.position) {
        case CRJBadgePositionCenterLeft:
            self.crj_left = -offset;
            self.crj_centerY = self.contentView.crj_middleY;
            break;
        case CRJBadgePositionCenterRight:
            self.crj_left = self.contentView.crj_width - offset;
            self.crj_centerY = self.contentView.crj_middleY;
            break;
        case CRJBadgePositionTopLeft:
            self.crj_left = -offset;
            self.crj_y    = -offset;
            break;
        case CRJBadgePositionTopRight:
            self.crj_top  = -offset;
            self.crj_left = self.contentView.crj_width - offset;
            break;
        case CRJBadgePositionBottomLeft:
            self.crj_left = -offset;
            self.crj_top = self.contentView.crj_height - offset;
            break;
        case CRJBadgePositionBottomRight:
            self.crj_left = self.contentView.crj_width - offset;
            self.crj_top = self.contentView.crj_height - offset;
            break;
        default:
            break;
    }
}

- (void)setBadgeValue:(NSString *)badgeValue {

    [self setBadgeValue:badgeValue animated:NO];
}

@end


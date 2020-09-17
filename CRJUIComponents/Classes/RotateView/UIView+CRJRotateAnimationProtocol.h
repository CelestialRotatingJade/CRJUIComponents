//
//  UIView+CRJRotateAnimationProtocol.h
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJRotateAnimationProtocol)

/**
 *  在初始化的时候保存transform的值
 */
@property (nonatomic) CGAffineTransform  crjDefaultTransform;

/**
 *  旋转的动画时间
 */
@property (nonatomic) CGFloat            crjRotateDuration;

@end


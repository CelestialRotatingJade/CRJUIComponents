//
//  UIButton+CRJEvent.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CRJButtonEvent_t)(UIButton *button);

@interface UIButton (CRJEvent)

/**
 *  Button's block event method.
 *
 *  @param block Button event block.
 */
- (void)crj_blockEvent:(CRJButtonEvent_t)block;

#pragma mark - Constructor

/**
 *  Constructor to create button.
 *
 *  @param frame       The button's frame.
 *  @param configBlock To config the button.
 *  @param eventBlock  The event block.
 *
 *  @return UIButton.
 */
+ (UIButton *)crj_buttonWithFrame:(CGRect)frame configBlock:(void (^)(UIButton *button))configBlock eventBlock:(CRJButtonEvent_t)eventBlock;

@end

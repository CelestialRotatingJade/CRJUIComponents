//
//  UIView+CRJUserInteraction.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CRJUserInteraction)

/**
 *  [Producer] Enable user interaction.
 */
- (void)crj_enabledUserInteraction;

/**
 *  [Consumer] Disable user interaction.
 */
- (void)crj_disableUserInteraction;

@end

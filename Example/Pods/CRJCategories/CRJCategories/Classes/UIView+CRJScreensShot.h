//
//  UIView+CRJScreensShot.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (CRJScreensShot)
/**
 Create a snapshot image of the complete view hierarchy.
 */
- (UIImage *)crj_snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (UIImage *)crj_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end

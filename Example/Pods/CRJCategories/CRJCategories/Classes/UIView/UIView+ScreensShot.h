//
//  UIView+ScreensShot.h
//  SaveImage
//
//  Created by YouXianMing on 16/7/13.
//  Copyright © 2016年 YouXianMing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ScreensShot)
/**
 Create a snapshot image of the complete view hierarchy.
 */
- (UIImage *)snapshotImage;

/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;

@end

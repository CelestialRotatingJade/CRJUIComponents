//
//  CRJBaseViewScreen.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import <FDFullscreenPopGesture/UINavigationController+FDFullscreenPopGesture.h>
#import <CRJCategories/CRJCategories.h>
#import <CRJGeneralTools/CRJDeviceInfo.h>
#import <CRJCommon/CRJCommon.h>
#import "CRJAppBar.h"
@interface CRJBaseViewScreen : UIViewController
/// Custom AppBar
@property (nonatomic, strong, readonly) CRJAppBar *appBar;
/// Custom View
@property (nonatomic, strong, readonly) UIView *contentView;
/// The backBtn
@property (nonatomic, strong, readonly) UIButton *backItem;
#pragma mark - 添加视图
- (void)setup;
- (void)initSubviews;
- (void)setupNavigationItems;
- (void)setupToolbarItems;

#pragma mark - 事件处理
- (void)backItemDidClicked;

@end

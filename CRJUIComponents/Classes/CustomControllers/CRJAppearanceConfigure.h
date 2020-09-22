//
//  CRJAppearanceConfigure.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CRJAppearanceConfigure : NSObject
#pragma mark - 颜色
/// app主色
@property(nonatomic, strong) UIColor *primaryColor;
/// app内页面的背景色
@property(nonatomic, strong) UIColor *scaffoldBackgroundColor;
/// topAppBar
@property(nonatomic, strong) UIColor *topAppBarColor;
@property(nonatomic, strong) UIColor *topAppBarTextColor;
@property(nonatomic, strong) UIFont  *topAppBarTextFont;
/// bottomAppBar
@property(nonatomic, strong) UIColor *bottomAppBarColor;
@property(nonatomic, strong) UIColor *bottomAppBarTextColor;
/// 分隔线的颜色
@property(nonatomic, strong) UIColor *dividerColor;

#pragma mark - 常用值
/// 导航条高度[内容高度=44]
@property(nonatomic, assign) CGFloat navigationBarHeight;
/// 底部导航条高度[内容高度=44]
@property(nonatomic, assign) CGFloat tabBarHeight;

#pragma mark - 图片
/// 返回键 topbar_back_black.png
@property(nonatomic, strong) UIImage *topbar_back_image;


+ (instancetype)sharedInstance;

// 统一配置导航栏外观，最好在AppDelegate中配置
- (void)setupDefaultConfigure;

// 自定义
- (void)setupCustomConfigure:(void (^)(CRJAppearanceConfigure *configure))block;

// 更新配置
- (void)updateConfigure:(void (^)(CRJAppearanceConfigure *configure))block;
@end


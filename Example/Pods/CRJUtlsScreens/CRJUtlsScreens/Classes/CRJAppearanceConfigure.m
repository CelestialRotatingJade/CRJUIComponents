//
//  CRJAppearanceConfigure.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/15.
//

#import "CRJAppearanceConfigure.h"

@implementation CRJAppearanceConfigure
+ (instancetype)sharedInstance {
    static CRJAppearanceConfigure *  _sharedObject = nil;
    static dispatch_once_t onceToken;
    dispatch_once( &onceToken, ^{
        _sharedObject = [[self alloc] init]; // or some other init method
    } );
    return _sharedObject;
}

// 设置默认的导航栏外观
- (void)setupDefaultConfigure {
#pragma mark - 颜色
    /// app主色
    _primaryColor = [UIColor orangeColor];

    /// app内页面的背景色
    _scaffoldBackgroundColor = [UIColor groupTableViewBackgroundColor];

    /// topAppBarColor的默认颜色
    _topAppBarColor = [UIColor whiteColor];
    _topAppBarTextColor = [UIColor blackColor];
    _topAppBarTextFont = [UIFont systemFontOfSize:17];
    /// bottomAppBarColor的默认颜色
    _bottomAppBarColor = [UIColor whiteColor];
    _bottomAppBarTextColor = [UIColor blackColor];

    /// 分隔线的颜色
    _dividerColor = [UIColor groupTableViewBackgroundColor];
    
   
#pragma mark - 常用值
    /// 导航条高度[内容高度=44]
    _navigationBarHeight = 44;
    /// 底部导航条高度[内容高度=44]
    _tabBarHeight = 44;

    
#pragma mark - 图片
    _topbar_back_image = [self imageFromCustomBundle:@"backArrow"];
}

- (void)setupCustomConfigure:(void (^)(CRJAppearanceConfigure *))block {
    [self setupDefaultConfigure];
    !block ? : block(self);
}

// 更新配置
- (void)updateConfigure:(void (^)(CRJAppearanceConfigure *configure))block {
    !block ? : block(self);
}


- (UIImage *)imageFromCustomBundle:(NSString *)name {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
        stringByAppendingPathComponent:@"/CRJUtlsScreens.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}
@end

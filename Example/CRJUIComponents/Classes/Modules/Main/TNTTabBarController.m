//
//  TNTTabBarController.m
//  CRJUIComponents_Example
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TNTTabBarController.h"
#import "TNTSettingScreen.h"
#import "TNTComponentsScreen.h"
#import "TNTNavigationController.h"

#define ktabBarItem_normal_color [[UIColor blackColor] colorWithAlphaComponent:0.5]
#define ktabBarItem_select_color [UIColor blackColor]
#define kTabbarHeight    ((CRJDeviceInfo.safeAreaInsets.bottom > 0) ? 83 : 49)     //适配tabbr高度

@interface TNTTabBarController ()

@end

@implementation TNTTabBarController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllChildViewControllers];
    
    [self.tabBar setBackgroundImage:[UIImage imageWithSize:CGSizeMake(CRJScreenSize().width, kTabbarHeight) color:[UIColor whiteColor]]];
    self.tabBar.tintColor = ktabBarItem_select_color;
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = ktabBarItem_normal_color;
    } else {
        // Fallback on earlier versions
    }
}

// 初始化所有的子控制器
- (void)setupAllChildViewControllers {
    // 1.ONE
    TNTComponentsScreen *message = [[TNTComponentsScreen alloc] init];
    [self setUpOneChildViewController:message imageName:@"main_tab_message" selectedImageName:@"main_tab_message_selected" title:@"消息"];

    // 2.TWO
    TNTSettingScreen *task = [[TNTSettingScreen alloc] init];
    [self setUpOneChildViewController:task imageName:@"main_tab_case" selectedImageName:@"main_tab_case_selected" title:@"任务"];
}
 
/**
 *  添加一个子控制器的方法
 */
- (void)setUpOneChildViewController:(UIViewController *)viewController
                          imageName:(NSString *)imageName
                  selectedImageName:(NSString *)selectedImageName
                              title:(NSString *)title {
    // 1.设置控制器的属性
    viewController.title = title;
    viewController.tabBarItem.title = title;
    // 设置图标
    viewController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中的图标
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    // 设置 tabbarItem 选中状态下的文字颜色(不被系统默认渲染,显示文字自定义颜色)
    NSDictionary *norAttr = [NSDictionary dictionaryWithObject:ktabBarItem_normal_color
                                                        forKey:NSForegroundColorAttributeName];
    NSDictionary *selAttr = [NSDictionary dictionaryWithObject:ktabBarItem_select_color
                                                        forKey:NSForegroundColorAttributeName];
    [viewController.tabBarItem setTitleTextAttributes:norAttr forState:UIControlStateNormal];
    [viewController.tabBarItem setTitleTextAttributes:selAttr forState:UIControlStateSelected];

    // 2.包装一个导航控制器
    TNTNavigationController *nav = [[TNTNavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:nav];
}


- (BOOL)shouldAutorotate {
    return self.selectedViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.selectedViewController supportedInterfaceOrientations];
}

//进入界面直接旋转的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}
@end

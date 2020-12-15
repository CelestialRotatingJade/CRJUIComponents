//
//  Macro.h
//  CRJUIComponents
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#ifndef Macro_h
#define Macro_h
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width //(e.g. 320)
#define kScreenSize [[UIScreen mainScreen] bounds].size //(e.g. 320,480)
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kUIWindow [[[UIApplication sharedApplication] delegate] window] //获得window


//是否iphoneX等刘海屏机型
#define kiPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

/*      color        */
#define CC_COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

#define CC_COLOR_A_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:((float)((hexValue & 0xFF000000) >> 24)) / 255.0]


#define kTabBarHeight (kiPhoneX ? 83 : 49)
#define kSearchBarHeight (kiPhoneX >= 11.0 ? 56 : 44)
#define kNavigationBarHeight 44

#endif /* Macro_h */

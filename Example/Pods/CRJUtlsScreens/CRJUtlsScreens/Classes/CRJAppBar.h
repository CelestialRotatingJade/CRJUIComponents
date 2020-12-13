//
//  CRJAppBar.h
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import <UIKit/UIKit.h>
#import <CRJCategories/CRJCategories.h>
#import "CRJAppearanceConfigure.h"
@interface CRJAppBar : UIView
/// 背景图
@property(nonatomic, strong) UIImageView *bgView;
/// 导航条
@property(nonatomic, strong) UIView *navigationBar;
/// 左侧
@property(nonatomic, strong) UIView *leftBarContainers;
/// 右侧
@property(nonatomic, strong) UIView *rightBarContainers;
/// 标题
@property(nonatomic, strong) UILabel *titleLabel;
/// 底部分割线
@property(nonatomic, strong) UIView *divideLine;

@property(nonatomic, strong) NSArray <UIView *>*leftBarButtonItems;
@property(nonatomic, strong) NSArray <UIView *>*rightBarButtonItems;
@end

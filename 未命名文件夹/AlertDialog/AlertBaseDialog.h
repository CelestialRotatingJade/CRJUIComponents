//
//  AlertBaseDialog.h
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionAnimator.h"
NS_ASSUME_NONNULL_BEGIN
@class AlertBaseDialog;

@protocol AlertBaseDialogDelegate <NSObject>

@optional
- (void)baseDialogWillShow:(AlertBaseDialog *)dialog;
- (void)baseDialogDidShow:(AlertBaseDialog *)dialog;
- (void)baseDialogWillHide:(AlertBaseDialog *)dialog;
- (void)baseDialogDidHide:(AlertBaseDialog *)dialog;
- (void)baseDialog:(AlertBaseDialog *)dialog didSelectedItems:(NSArray *)items;

- (void)baseDialog:(AlertBaseDialog *)dialog didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface AlertBaseDialog : UIViewController
@property(nonatomic, assign) NSInteger tag;
@property(nonatomic, strong) id picker;
// weak对象
@property(nonatomic, weak) id object;
// 代理
@property(nonatomic, weak) id <AlertBaseDialogDelegate>delegate;
// 可根据该属性设置内容视图高度，一般不需要设置。
@property(nonatomic, strong) TransitionAnimator *animator;
// 信息数据
@property(nonatomic, strong) id info;
// 选中内容,可能是数组,可能是一个对象
@property(nonatomic, strong) id selectedItem;
// 显示内容的数据
@property(nonatomic, strong) NSArray *showDatas;


+ (TransitionAnimator *)defaultAnimator;
#pragma mark - Chain Programming.

+ (instancetype)build;
- (AlertBaseDialog *(^)(NSInteger tag))withTag;
- (AlertBaseDialog *(^)(TransitionAnimator *animator))withAnimator;
- (AlertBaseDialog *(^)(id object))withObject;
- (AlertBaseDialog *(^)(id <AlertBaseDialogDelegate> delegate))withDelegate;
- (AlertBaseDialog *(^)(id info))withInfo;
- (AlertBaseDialog *(^)(id selectedItem))withSelectedItem;
- (AlertBaseDialog *(^)(NSArray *showDatas))withShowDatas;
- (AlertBaseDialog *(^)(void))prepareFinish;//最后调用！！！

@end

NS_ASSUME_NONNULL_END

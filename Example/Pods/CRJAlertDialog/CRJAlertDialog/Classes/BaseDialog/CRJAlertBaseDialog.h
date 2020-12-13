//
//  CRJAlertBaseDialog.h
//  Pods
//
//  Created by zhuyuhui on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import <CRJTransitionAnimator/CRJTransitionAnimator.h>

NS_ASSUME_NONNULL_BEGIN
@class CRJAlertBaseDialog;

@protocol CRJAlertBaseDialogDelegate <NSObject>

@optional
- (void)baseDialogWillShow:(CRJAlertBaseDialog *)dialog;
- (void)baseDialogDidShow:(CRJAlertBaseDialog *)dialog;
- (void)baseDialogWillHide:(CRJAlertBaseDialog *)dialog;
- (void)baseDialogDidHide:(CRJAlertBaseDialog *)dialog;
- (void)baseDialog:(CRJAlertBaseDialog *)dialog didSelectedItems:(NSArray *)items;

- (void)baseDialog:(CRJAlertBaseDialog *)dialog didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface CRJAlertBaseDialog : UIViewController
@property(nonatomic, assign) NSInteger tag;
@property(nonatomic, strong) id picker;
// weak对象
@property(nonatomic, weak) id object;
// 代理
@property(nonatomic, weak) id <CRJAlertBaseDialogDelegate>delegate;
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
- (CRJAlertBaseDialog *(^)(NSInteger tag))withTag;
- (CRJAlertBaseDialog *(^)(TransitionAnimator *animator))withAnimator;
- (CRJAlertBaseDialog *(^)(id object))withObject;
- (CRJAlertBaseDialog *(^)(id <CRJAlertBaseDialogDelegate> delegate))withDelegate;
- (CRJAlertBaseDialog *(^)(id info))withInfo;
- (CRJAlertBaseDialog *(^)(id selectedItem))withSelectedItem;
- (CRJAlertBaseDialog *(^)(NSArray *showDatas))withShowDatas;

@end

NS_ASSUME_NONNULL_END

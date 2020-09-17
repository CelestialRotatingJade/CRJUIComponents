//
//  CRJBaseShowPickerView.h
//  CRJShowPickerView
//
//  Created by zhuyuhui on 2020/9/13.
//

#import <UIKit/UIKit.h>
@class CRJBaseShowPickerView;

@protocol CRJBaseShowPickerViewDelegate <NSObject>

@optional
- (void)baseShowPickerViewWillShow:(CRJBaseShowPickerView *)showPickerView;
- (void)baseShowPickerViewDidShow:(CRJBaseShowPickerView *)showPickerView;
- (void)baseShowPickerViewWillHide:(CRJBaseShowPickerView *)showPickerView;
- (void)baseShowPickerViewDidHide:(CRJBaseShowPickerView *)showPickerView;
- (void)baseShowPickerView:(CRJBaseShowPickerView *)showPickerView didSelectedIndexs:(NSArray <NSNumber *> *)indexs items:(NSArray *)items;

@end

@interface CRJBaseShowPickerView : UIView
// 代理
@property (nonatomic, weak) id<CRJBaseShowPickerViewDelegate> delegate;

// contentView的高度,需要子类提供数据
@property (nonatomic, class, readonly) CGFloat contentViewHeight;
// 由子类在buildViewsInContentView中赋值,在configPicker中使用
@property (nonatomic, weak) id picker;
// weak对象
@property (nonatomic, weak) id object;
// 信息数据
@property (nonatomic, strong) id info;
// 选中内容,可能是数组,可能是一个对象
@property (nonatomic, strong) id selectedItem;
// 显示内容的数据
@property (nonatomic, strong) NSArray *showDatas;

+ (instancetype)showPickerViewWithDelegate:(id <CRJBaseShowPickerViewDelegate>)delegate
                                       tag:(NSInteger)tag
                                    object:(id)object
                                      info:(id)info
                              selectedItem:(id)selectedItem
                                 showDatas:(NSArray *)showDatas;

/**
 在执行此方法之前,需要先提供contentViewHeight的数值
 */
- (void)prepare;

/**
 [子类重载] 在contentView中添加内容
 */
- (void)buildViewsInContentView:(UIView *)contentView;

/**
 [子类重载] 对picker进行配置以及数据的处理
 */
- (void)configPicker;

/**
 在keyWindow中显示
 */
- (void)showInKeyWindow;

/**
 在keyWindow中隐藏
 */
- (void)hideFromKeyWindow;

#pragma mark - Chain Programming.

+ (instancetype)build;
- (CRJBaseShowPickerView *(^)(NSInteger tag))withTag;
- (CRJBaseShowPickerView *(^)(id object))withObject;
- (CRJBaseShowPickerView *(^)(id <CRJBaseShowPickerViewDelegate> delegate))withDelegate;
- (CRJBaseShowPickerView *(^)(id info))withInfo;
- (CRJBaseShowPickerView *(^)(id selectedItem))withSelectedItem;
- (CRJBaseShowPickerView *(^)(NSArray *showDatas))withShowDatas;
- (CRJBaseShowPickerView *(^)(void))prepareAndShowInKeyWindow;

@end




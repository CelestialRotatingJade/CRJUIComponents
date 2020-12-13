//
//  CRJSingleChoiceDialog.h
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/12.
//  单选控制器

#import <CRJAlertDialog/CRJAlertBaseDialog.h>
#import <CRJCategories/CRJCategories.h>
#import <Masonry/Masonry.h>

#import "CRJSingleChoiceDialogCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface CRJSingleChoiceDialog : CRJAlertBaseDialog
@property(nonatomic, strong) Class cellClass;//CRJSingleChoiceDialogCell 子类

- (CRJSingleChoiceDialog *(^)(Class cellClass))withCellClass;

@end

NS_ASSUME_NONNULL_END

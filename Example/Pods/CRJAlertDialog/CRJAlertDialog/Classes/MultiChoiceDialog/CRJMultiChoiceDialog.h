//
//  CRJMultiChoiceDialog.h
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/13.
//

#import <CRJAlertDialog/CRJAlertBaseDialog.h>
#import <CRJCategories/CRJCategories.h>
#import <Masonry/Masonry.h>

#import "CRJMultiChoiceDialogCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface CRJMultiChoiceDialog : CRJAlertBaseDialog
///tableView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@property (nonatomic, strong) NSMutableArray *selectDatas;//选中
@property (nonatomic, strong) NSMutableArray *disableDatas;//不可选中

@property(nonatomic, strong) Class cellClass;//CRJSingleSelectCell 子类

- (CRJMultiChoiceDialog *(^)(Class cellClass))withCellClass;
@end

NS_ASSUME_NONNULL_END


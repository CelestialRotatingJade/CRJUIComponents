//
//  AlertMultiChoiceDialog.h
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import <CRJAlertDialog/AlertBaseDialog.h>
#import "AlertMultiChoiceDialogCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface AlertMultiChoiceDialog : AlertBaseDialog
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;//数据源
@property (nonatomic, strong) NSMutableArray *checkedItems;//选中
@property (nonatomic, strong) NSMutableArray *disableItems;//不可选中


@property(nonatomic, strong) Class cellClass;//AlertMultiChoiceDialogCell 子类
#pragma mark - Useful Method
- (void)enableItem:(id)item enable:(BOOL)enable;
- (void)checkedItem:(id)item check:(BOOL)check;

- (AlertMultiChoiceDialog *(^)(Class cellClass))withCellClass;
@end

NS_ASSUME_NONNULL_END

//
//  AlertSingleChoiceDialog.h
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import "AlertBaseDialog.h"
#import "AlertSingleChoiceDialogCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlertSingleChoiceDialog : AlertBaseDialog
@property(nonatomic, strong) Class cellClass;//AlertSingleChoiceDialogCell 子类

- (AlertSingleChoiceDialog *(^)(Class cellClass))withCellClass;

@end

NS_ASSUME_NONNULL_END

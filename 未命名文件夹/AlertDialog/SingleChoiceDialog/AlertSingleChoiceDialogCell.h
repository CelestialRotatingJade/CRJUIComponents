//
//  AlertSingleChoiceDialogCell.h
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN

@interface AlertSingleChoiceDialogCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) id data;
- (void)setupCell;
- (void)buildSubview;
- (void)loadContent;
- (void)setCellSelect:(BOOL)select;
@end

NS_ASSUME_NONNULL_END

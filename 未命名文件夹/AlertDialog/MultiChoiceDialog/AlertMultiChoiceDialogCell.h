//
//  AlertMultiChoiceDialogCell.h
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN
@class AlertMultiChoiceDialog;
@interface AlertMultiChoiceDialogCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *selectImgView;
@property (nonatomic, strong) UIView *bLine;
@property (nonatomic, strong) id data;
@property (nonatomic, weak) AlertMultiChoiceDialog *dialog;

- (void)setupCell;
- (void)buildSubview;
- (void)loadContent;
@end

NS_ASSUME_NONNULL_END

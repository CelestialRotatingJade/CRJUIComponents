//
//  CRJMultiChoiceDialogCell.h
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/13.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN
@class CRJMultiChoiceDialog;
@interface CRJMultiChoiceDialogCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *markLabel;
@property (nonatomic, strong) id data;
@property (nonatomic, weak) CRJMultiChoiceDialog *dialog;


- (void)setupCell;
- (void)buildSubview;
- (void)loadContent;

@end

NS_ASSUME_NONNULL_END


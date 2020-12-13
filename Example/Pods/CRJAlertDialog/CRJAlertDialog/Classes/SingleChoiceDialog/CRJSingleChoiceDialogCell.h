//
//  CRJSingleChoiceDialogCell.h
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/12.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
NS_ASSUME_NONNULL_BEGIN

@interface CRJSingleChoiceDialogCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) id data;
- (void)setupCell;
- (void)buildSubview;
- (void)loadContent;
- (void)setCellSelect:(BOOL)select;
@end

NS_ASSUME_NONNULL_END

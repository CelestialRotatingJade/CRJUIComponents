//
//  CRJMultiChoiceDialogCell.m
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/13.
//

#import "CRJMultiChoiceDialogCell.h"
#import "CRJMultiChoiceDialog.h"
@implementation CRJMultiChoiceDialogCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupCell];
    
    [self buildSubview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}


- (void)buildSubview {
    [self.contentView addSubview:self.markLabel];
    [self.markLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.markLabel.superview);
        make.right.equalTo(self.markLabel.superview).offset(-12);
    }];
    
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel.superview);
        make.left.equalTo(self.titleLabel.superview).offset(12);
        make.right.equalTo(self.markLabel.mas_left).offset(-12);
    }];
    
    // 设置优先级
    [self.markLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
        
}

- (void)loadContent {
    if ([self.data isKindOfClass:NSString.class]) {
        self.titleLabel.text = self.data;
    }
    
    if ([self.dialog.disableDatas containsObject:self.data]) {
        self.markLabel.text = @"disable";
        self.titleLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
        if ([self.dialog.selectDatas containsObject:self.data]) {
            self.markLabel.text = @"select";
        } else {
            self.markLabel.text = @"unselect";
        }
    }
}

#pragma mark - 懒加载
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)markLabel {
    if (!_markLabel) {
        _markLabel = [[UILabel alloc] init];
        _markLabel.textColor = [UIColor grayColor];
        _markLabel.font = [UIFont systemFontOfSize:15];
    }
    return _markLabel;
}
@end

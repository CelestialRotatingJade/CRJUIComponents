//
//  CRJSingleChoiceDialogCell.m
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "CRJSingleChoiceDialogCell.h"

@implementation CRJSingleChoiceDialogCell

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
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLabel.superview);
        make.left.equalTo(self.titleLabel.superview).offset(12);
        make.right.equalTo(self.titleLabel.superview).offset(-12);
    }];
}

- (void)loadContent {
    if ([self.data isKindOfClass:NSString.class]) {
        self.titleLabel.text = self.data;
    }
}


- (void)setCellSelect:(BOOL)select {
    if (select) {
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    } else {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
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
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

//
//  SingleChoiceCell.m
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/11/6.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import "SingleChoiceCell.h"

@implementation SingleChoiceCell
- (void)setupCell {
//    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    self.layer.borderWidth = 1;
//    self.layer.cornerRadius = 2;
//    self.layer.masksToBounds = YES;
}

- (void)buildSubview {
    [self.contentView addSubview:self.titleLabel];
}

- (void)loadContent {}


- (void)layoutSubviews {
    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end

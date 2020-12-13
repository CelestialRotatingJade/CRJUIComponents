//
//  CRJDateItemPickerView.m
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "CRJDateItemPickerView.h"

@interface CRJDateItemPickerView()
///toolBar
@property (nonatomic, strong) UIView *toolBar;
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UILabel *titleL;

@end

@implementation CRJDateItemPickerView

- (void)buildViewsInContentView:(UIView *)contentView {
    // 顶部白色的view
    self.toolBar.frame = CGRectMake(0, 0, contentView.width, 40);
    [contentView addSubview:self.toolBar];
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        self.titleL.text = self.info;
    }
    
    UIDatePicker *picker  = [[UIDatePicker alloc] init];
    picker.datePickerMode = UIDatePickerModeDate;
    if (@available(iOS 13.4, *)) {
        picker.preferredDatePickerStyle = UIDatePickerStyleWheels;//滚轮
    }
    [picker addTarget:self action:@selector(datePickerEvent:) forControlEvents:UIControlEventValueChanged];
    //最后设置frame！
    picker.frame = CGRectMake(0, 40.f, contentView.width, 180.f);
    self.picker           = picker;
    [contentView addSubview:picker];
}

- (void)configPicker {
    UIDatePicker *picker = self.picker;
    if (self.selectedItem && [self.selectedItem isKindOfClass:[NSDate class]]) {
        picker.date = self.selectedItem;
    }
}

- (void)datePickerEvent:(UIDatePicker *)picker {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerView:didSelectedIndexs:items:)]) {
        
        [self.delegate baseShowPickerView:self didSelectedIndexs:nil items:@[picker.date]];
    }
}

+ (CGFloat)contentViewHeight {
    
    CGFloat bottomHeight = 0;
    
    if (CRJDeviceInfo.isFringeScreen == YES) {
        
        bottomHeight = CRJDeviceInfo.fringeScreenBottomSafeHeight;
    }
    
    return 180.f + 40.f + bottomHeight;
}

- (void)clickCancleBtn {
    [self hideFromKeyWindow];
}

- (void)clickSureBtn {
    [self hideFromKeyWindow];
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerView:didSelectedIndexs:items:)]) {
        
        UIDatePicker *picker = self.picker;
        [self.delegate baseShowPickerView:self didSelectedIndexs:nil items:@[picker.date]];
    }
}


#pragma mark - 懒加载
- (UIView *)toolBar {
    if (!_toolBar) {
        _toolBar = [[UIView alloc] init];
        _toolBar.backgroundColor = [UIColor whiteColor];
        [_toolBar addSubview:self.cancleBtn];
        [_toolBar addSubview:self.sureBtn];
        [_toolBar addSubview:self.titleL];
        
        UIView *separator = [[UIView alloc] init];
        separator.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_toolBar addSubview:separator];

        
        [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.cancleBtn.superview).offset(16);
          make.centerY.equalTo(self.cancleBtn.superview).offset(0);
        }];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
          make.right.equalTo(self.sureBtn.superview).offset(-16);
          make.centerY.equalTo(self.sureBtn.superview).offset(0);
        }];
        [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
          make.left.equalTo(self.titleL.superview.mas_left).offset(50);
          make.right.equalTo(self.titleL.superview.mas_right).offset(-50);
          make.centerY.equalTo(self.titleL.superview).offset(0);
        }];
        [separator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(separator.superview.mas_bottom).offset(0);
            make.leading.equalTo(separator.superview.mas_leading);
            make.trailing.equalTo(separator.superview.mas_trailing);
            make.height.mas_equalTo(1);
        }];
    }
    return _toolBar;
}

- (UILabel *)titleL {
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = [UIFont systemFontOfSize:15];
        _titleL.textAlignment = NSTextAlignmentCenter;
    }
    return _titleL;
}

- (UIButton *)cancleBtn {
    if (!_cancleBtn) {
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [customBtn setTitle:@"取消" forState:UIControlStateNormal];
        [customBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [customBtn addTarget:self action:@selector(clickCancleBtn) forControlEvents:UIControlEventTouchUpInside];
        _cancleBtn = customBtn;
    }
    return _cancleBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [customBtn setTitle:@"确定" forState:UIControlStateNormal];
        [customBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [customBtn addTarget:self action:@selector(clickSureBtn) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn = customBtn;
    }
    return _sureBtn;
}
@end

//
//  CRJDateItemPickerView.m
//  Pods
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "CRJDateItemPickerView.h"

@implementation CRJDateItemPickerView

- (void)buildViewsInContentView:(UIView *)contentView {
    
    // 顶部白色的view
    UIView *topWhiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CRJScreenSize().width, 40.f)];
    [contentView addSubview:topWhiteView];
    
    // 确定按钮
    UIButton *button       = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    button.right           = CRJScreenSize().width;
    [button setNormalTitle:@"确定"];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    [button addTarget:self action:@selector(buttonEvent)];
    [topWhiteView addSubview:button];
    
    [button titleLabelHorizontalAlignment:UIControlContentHorizontalAlignmentRight
                        verticalAlignment:UIControlContentVerticalAlignmentCenter
                        contentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 12.f)];
    
    [button titleLabelColorWithNormalStateColor:[UIColor blackColor]
                          highlightedStateColor:[[UIColor blackColor] colorWithAlphaComponent:0.5f]
                             disabledStateColor:nil];
    
    // 顶部线条
    UIView *line         = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CRJScreenSize().width, 0.5f)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [topWhiteView addSubview:line];
    
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        
        UILabel *label               = [UILabel new];
        label.text                   = self.info;
        label.font                   = [UIFont systemFontOfSize:15.f];
        label.textColor              = [[UIColor grayColor] colorWithAlphaComponent:0.5f];
        label.userInteractionEnabled = NO;
        [label sizeToFit];
        
        label.center = topWhiteView.middlePoint;
        [topWhiteView addSubview:label];
    }
    
    UIDatePicker *picker  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40.f, CRJScreenSize().width, 180.f)];
    picker.datePickerMode = UIDatePickerModeDate;
    [picker addTarget:self action:@selector(datePickerEvent:) forControlEvents:UIControlEventValueChanged];
    
    self.picker           = picker;
    [contentView addSubview:picker];
}

- (void)configPicker {
    
    UIDatePicker *picker = self.picker;
    picker.minimumDate   = [NSDate date];
    
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

- (void)buttonEvent {
    
    [self hideFromKeyWindow];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerView:didSelectedIndexs:items:)]) {
        
        UIDatePicker *picker = self.picker;
        [self.delegate baseShowPickerView:self didSelectedIndexs:nil items:@[picker.date]];
    }
}

@end

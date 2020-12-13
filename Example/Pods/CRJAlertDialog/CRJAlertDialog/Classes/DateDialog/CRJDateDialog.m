//
//  CRJDateDialog.m
//  CRJAlertController
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "CRJDateDialog.h"

@interface CRJDateDialog ()

@end

@implementation CRJDateDialog
+ (TransitionAnimator *)defaultAnimator {
    DLAnimationBottom *animator = [[DLAnimationBottom alloc] init];
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    animator.contentHeightRatio = 250.f / screenH;
    return animator;
}

#pragma mark -
#pragma mark - clickEvent

- (void)clickCancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)clickConfirm {
    UIDatePicker *picker = self.picker;
    NSMutableArray *items = [NSMutableArray array];
    if (picker.date) {
        [items addObject:picker.date];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialog:didSelectedItems:)]) {
        [self.delegate baseDialog:self didSelectedItems:items];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark - UI

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor whiteColor];
    
#pragma mark - 顶部
    UIView *topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 40)];
    [self.view addSubview:topBarView];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"选择日期";
    titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(titleLabel.superview);
    }];
    if (self.info && [self.info isKindOfClass:[NSString class]]) {
        titleLabel.text = self.info;
    }
    
    
    UIButton *cancelBtn = [[UIButton alloc] init];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cancelBtn.superview).offset(15);
        make.centerY.equalTo(cancelBtn.superview);
    }];
    [cancelBtn addTarget:self action:@selector(clickCancel) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *confirmBtn = [[UIButton alloc] init];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
    [topBarView addSubview:confirmBtn];
    [confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(confirmBtn.superview).offset(-15);
        make.centerY.equalTo(confirmBtn.superview);
    }];
    [confirmBtn addTarget:self action:@selector(clickConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    
#pragma mark - 其他
    UIDatePicker *datePicker  = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(datePickerEvent:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:datePicker];
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(topBarView.mas_bottom).offset(0);
    }];
    self.picker = datePicker;
    
    [self setupInitialData];
}

- (void)setupInitialData {
    UIDatePicker *picker = self.picker;
    picker.minimumDate   = [NSDate date];
    if (self.selectedItem && [self.selectedItem isKindOfClass:[NSDate class]]) {
        picker.date = self.selectedItem;
    }
}


#pragma mark -
#pragma mark - datePickerEvent
- (void)datePickerEvent:(UIDatePicker *)picker {

}

@end

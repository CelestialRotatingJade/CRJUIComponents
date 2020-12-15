//
//  TNTDateItemPickerViewScreen.m
//  CRJUIComponents_Example
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TNTDateItemPickerViewScreen.h"
#import <CRJAlertDialog/CRJAlertDialog.h>
#import <CRJTransitionAnimator/CRJTransitionAnimator.h>
#import <Toast/Toast.h>
@interface TNTDateItemPickerViewScreen ()<CRJAlertBaseDialogDelegate>

@end

@implementation TNTDateItemPickerViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)showPicker {
    
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        [datas addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [self dissMissPresentedViewController:^{
        CRJAlertBaseDialog *dialog = CRJDateDialog.build.withDelegate(self).withInfo(@"请选择开始日期");
        [self presentViewController:dialog animation:[DLAnimationBottom new] completion:^{
            
        }];

    }];
}

- (void)dissMissPresentedViewController:(void (^)(void))completion {
    if (self.presentedViewController) {
        UIViewController *topVC = self.presentedViewController;
        [topVC dismissViewControllerAnimated:NO completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (completion) {
                completion();
            }
        });
        
    } else {
        if (completion) {
            completion();
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showPicker];
//    UIDatePicker *picker  = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 140.f, self.view.width, 180.f)];
//    picker.datePickerMode = UIDatePickerModeDate;
//    if (@available(iOS 13.4, *)) {
////        picker.preferredDatePickerStyle = UIDatePickerStyleWheels;//滚轮
//    }
//
//    [self.contentView addSubview:picker];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showPicker];
    });
    
    
}


#pragma mark - CRJAlertBaseDialogDelegate
-(void)baseDialog:(CRJAlertBaseDialog *)dialog didSelectedItems:(NSArray *)items {
    if (items) {
        [self.view makeToast:[NSString stringWithFormat:@"%@",items.firstObject]];
    }
}

- (void)baseDialogWillShow:(CRJAlertBaseDialog *)dialog {
    if ([dialog isKindOfClass:CRJDateDialog.class]) {
        UIDatePicker *picker = dialog.picker;
        if (@available(iOS 13.4, *)) {
            picker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];//新发现这里不会根据系统的语言变了
            picker.preferredDatePickerStyle = UIDatePickerStyleWheels;
        } else {
            // Fallback on earlier versions
        }
    }
}
@end

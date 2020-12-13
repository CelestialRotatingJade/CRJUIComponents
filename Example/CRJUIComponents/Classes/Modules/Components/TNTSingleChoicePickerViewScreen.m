//
//  TNTSingleChoicePickerViewScreen.m
//  CRJUIComponents_Example
//
//  Created by zhuyuhui on 2020/12/11.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TNTSingleChoicePickerViewScreen.h"
#import <CRJAlertDialog/CRJAlertDialog.h>
#import <Toast/Toast.h>
@interface TNTSingleChoicePickerViewScreen ()<CRJAlertBaseDialogDelegate>

@end

@implementation TNTSingleChoicePickerViewScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)showPicker {
    
    NSMutableArray *datas = [NSMutableArray array];
    for (int i = 0; i < 1000; i++) {
        [datas addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    CRJAlertBaseDialog *dialog = CRJSingleChoiceDialog.build.withAnimator(CRJSingleChoiceDialog.defaultAnimator).withDelegate(self).withShowDatas(datas).withInfo(@"请选择开始日期");
    [self presentViewController:dialog animation:CRJSingleChoiceDialog.defaultAnimator completion:^{
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showPicker];
}


#pragma mark - CRJAlertBaseDialogDelegate
-(void)baseDialog:(CRJAlertBaseDialog *)dialog didSelectedItems:(NSArray *)items {
    if (items) {
        [self.view makeToast:[NSString stringWithFormat:@"%@",items.firstObject]];
    }
}
@end

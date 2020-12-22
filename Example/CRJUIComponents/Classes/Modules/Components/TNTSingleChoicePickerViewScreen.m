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
@interface TNTSingleChoicePickerViewScreen ()<AlertBaseDialogDelegate>

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
    
    AlertSingleChoiceDialog *dialog = AlertSingleChoiceDialog.build;
    dialog.withDelegate(self);
    dialog.withShowDatas(datas).withInfo(@"请选择开始日期").prepareFinish();
    [self presentViewController:dialog
                      animation:dialog.animator completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self showPicker];
}


#pragma mark - CRJAlertBaseDialogDelegate
-(void)baseDialog:(AlertBaseDialog *)dialog didSelectedItems:(NSArray *)items {
    if (items) {
        [self.view makeToast:[NSString stringWithFormat:@"%@",items.firstObject]];
    }
}
@end

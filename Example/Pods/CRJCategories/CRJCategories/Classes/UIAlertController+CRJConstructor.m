//
//  UIAlertController+CRJConstructor.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UIAlertController+CRJConstructor.h"

@implementation UIAlertController (CRJConstructor)
+ (void)crj_alertControllerShowInController:(UIViewController *)controller
                                     title:(NSString *)title
                                   message:(NSString *)message
                            preferredStyle:(UIAlertControllerStyle)preferredStyle
                         alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                                completion:(void (^)(void))completion {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:preferredStyle];
    
    NSMutableArray *alertActions = [NSMutableArray array];
    
    if (alertActionsBlock) {
        
        alertActionsBlock(alertActions);
    }
    
    for (UIAlertAction *action in alertActions) {
        
        [alertController addAction:action];
    }
    
    [controller presentViewController:alertController animated:YES completion:completion];
}

+ (void)crj_actionSheetStyleShowInController:(UIViewController *)controller
                                      title:(NSString *)title
                                    message:(NSString *)message
                          alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                                 completion:(void (^)(void))completion {
    
    [[self class] crj_alertControllerShowInController:controller
                                               title:title
                                             message:message
                                      preferredStyle:UIAlertControllerStyleActionSheet
                                   alertActionsBlock:alertActionsBlock
                                          completion:completion];
}

+ (void)crj_alertStyleShowInController:(UIViewController *)controller
                                title:(NSString *)title
                              message:(NSString *)message
                    alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                           completion:(void (^)(void))completion {
    
    [[self class] crj_alertControllerShowInController:controller
                                               title:title
                                             message:message
                                      preferredStyle:UIAlertControllerStyleAlert
                                   alertActionsBlock:alertActionsBlock
                                          completion:completion];
}
@end

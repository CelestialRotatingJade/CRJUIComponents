//
//  UIAlertController+CRJConstructor.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIAlertController (CRJConstructor)

/**
 *  AlertController show in controller.
 *
 *  @param controller        The controller to show the AlertController.
 *  @param title             Title.
 *  @param message           Message.
 *  @param preferredStyle    Constants indicating the type of alert to display.
 *  @param alertActionsBlock An array to add UIAlertActions.
 *  @param completion        The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 */
+ (void)crj_alertControllerShowInController:(UIViewController *)controller
                                     title:(NSString *)title
                                   message:(NSString *)message
                            preferredStyle:(UIAlertControllerStyle)preferredStyle
                         alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                                completion:(void (^)(void))completion;

/**
 *  Alert style AlertController show in controller.
 *
 *  @param controller        The controller to show the AlertController.
 *  @param title             Title.
 *  @param message           Message.
 *  @param alertActionsBlock An array to add UIAlertActions.
 *  @param completion        The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 */
+ (void)crj_alertStyleShowInController:(UIViewController *)controller
                                title:(NSString *)title
                              message:(NSString *)message
                    alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                           completion:(void (^)(void))completion;

/**
 *  Action style AlertController show in controller.
 *
 *  @param controller        The controller to show the AlertController.
 *  @param title             Title.
 *  @param message           Message.
 *  @param alertActionsBlock An array to add UIAlertActions.
 *  @param completion        The block to execute after the presentation finishes. This block has no return value and takes no parameters. You may specify nil for this parameter.
 */
+ (void)crj_actionSheetStyleShowInController:(UIViewController *)controller
                                      title:(NSString *)title
                                    message:(NSString *)message
                          alertActionsBlock:(void (^)(NSMutableArray <UIAlertAction *> *alertActions))alertActionsBlock
                                 completion:(void (^)(void))completion;
@end

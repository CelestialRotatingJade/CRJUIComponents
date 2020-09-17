//
//  UILabel+CRJSizeToFit.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CRJSizeToFit)
- (void)crj_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock;
- (void)crj_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock;
@end

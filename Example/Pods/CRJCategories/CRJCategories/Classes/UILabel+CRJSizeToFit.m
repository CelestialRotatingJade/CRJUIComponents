//
//  UILabel+CRJSizeToFit.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "UILabel+CRJSizeToFit.h"

@implementation UILabel (CRJSizeToFit)
- (void)crj_sizeToFitWithText:(NSString *)text config:(void (^)(UILabel *label))configBlock {

    self.text = text;
    [self sizeToFit];
    
    if (configBlock) {
        
        configBlock(self);
    }
}

- (void)crj_sizeToFitWithAttributedText:(NSAttributedString *)text config:(void (^)(UILabel *label))configBlock {
    
    self.attributedText = text;
    [self sizeToFit];
    
    if (configBlock) {
        
        configBlock(self);
    }
}
@end

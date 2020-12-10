//
//  TNTItemStyle.m
//  CRJUIComponents_Example
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TNTItemStyle.h"

@implementation TNTItemStyle
+ (TNTItemStyle *)create:(void (^)(TNTItemStyle * _Nonnull))block {
    TNTItemStyle *style = [TNTItemStyle new];
    if (block) {
        block(style);
    }
    return style;
}
@end

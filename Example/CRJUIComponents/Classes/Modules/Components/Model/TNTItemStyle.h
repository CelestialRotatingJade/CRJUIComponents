//
//  TNTItemStyle.h
//  CRJUIComponents_Example
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface TNTItemStyle : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) Class controller;

+ (TNTItemStyle *)create:(void (^)(TNTItemStyle *style))block;
@end

NS_ASSUME_NONNULL_END

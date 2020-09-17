//
//  NSBundle+CRJAssociatedBundle.h
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSBundle (CRJAssociatedBundle)
/**
 获取指定NSBundle，默认情况下podName和bundlename相同，传一个即可
 
 @param bundleName bundle名字，就是在resource_bundles里面的名字
 @param podName pod的名字
 @return bundle
 */
+ (NSBundle *)crj_bundleWithBundleName:(NSString *)bundleName podName:(NSString *)podName;

@end

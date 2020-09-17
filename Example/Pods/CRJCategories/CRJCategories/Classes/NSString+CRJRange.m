//
//  NSString+CRJRange.m
//  CRJCategories_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "NSString+CRJRange.h"

@implementation NSString (CRJRange)
- (NSArray <NSValue *> *)crj_rangesOfString:(NSString *)searchString options:(NSStringCompareOptions)mask serachRange:(NSRange)range {

    NSMutableArray *array = [NSMutableArray array];
    [self rangeOfString:searchString range:NSMakeRange(0, self.length) array:array options:mask];
    
    return array;
}

- (void)rangeOfString:(NSString *)searchString
                range:(NSRange)searchRange
                array:(NSMutableArray *)array
              options:(NSStringCompareOptions)mask {

    NSRange range = [self rangeOfString:searchString options:mask range:searchRange];
    
    if (range.location != NSNotFound) {
        
        [array addObject:[NSValue valueWithRange:range]];
        [self rangeOfString:searchString
                      range:NSMakeRange(range.location + range.length, self.length - (range.location + range.length))
                      array:array
                    options:mask];
    }
}

@end

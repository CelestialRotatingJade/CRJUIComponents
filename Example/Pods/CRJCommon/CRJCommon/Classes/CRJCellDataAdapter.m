//
//  CRJCellDataAdapter.m
//  CRJCommon
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "CRJCellDataAdapter.h"

@implementation CRJCellDataAdapter
+ (CRJCellDataAdapter *)adapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                  data:(id)data
                                            cellHeight:(CGFloat)cellHeight
                                              cellType:(NSInteger)cellType
{
    CRJCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellHeight          = cellHeight;
    adapter.cellType            = cellType;
    
    return adapter;
}

+ (CRJCellDataAdapter *)adapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                  data:(id)data
                                            cellHeight:(CGFloat)cellHeight
                                             cellWidth:(CGFloat)cellWidth
                                              cellType:(NSInteger)cellType
{
    
    CRJCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellHeight          = cellHeight;
    adapter.cellWidth           = cellWidth;
    adapter.cellType            = cellType;
    
    return adapter;
}

+ (CRJCellDataAdapter *)adapterWithCellReuseIdentifier:(NSString *)cellReuseIdentifiers
                                                  data:(id)data
                                              cellType:(NSInteger)cellType
{
    CRJCellDataAdapter *adapter    = [[self class] new];
    adapter.cellReuseIdentifier = cellReuseIdentifiers;
    adapter.data                = data;
    adapter.cellType            = cellType;
    
    return adapter;
}
@end

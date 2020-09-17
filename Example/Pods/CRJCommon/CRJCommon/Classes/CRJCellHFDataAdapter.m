//
//  CRJCellHFDataAdapter.m
//  CRJCommon
//
//  Created by zhuyuhui on 2020/9/7.
//

#import "CRJCellHFDataAdapter.h"

@implementation CRJCellHFDataAdapter
+ (instancetype)adapterWithReuseIdentifier:(NSString *)reuseIdentifier
                                      data:(id)data
                                    height:(CGFloat)height
                                      type:(NSInteger)type
{
    CRJCellHFDataAdapter *adapter = [[self class] new];
    adapter.reuseIdentifier              = reuseIdentifier;
    adapter.data                         = data;
    adapter.height                       = height;
    adapter.type                         = type;
    
    return adapter;
}
@end

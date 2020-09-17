//
//  CRJIconEdgeInsetsLabel.h
//  CRJEdgeInsetsLabel
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <UIKit/UIKit.h>
#import <CRJCategories/CRJCategories.h>
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    CRJIconAtLeft,
    CRJIconAtRight,
} CRJIconEdgeDirection;
@interface CRJIconEdgeInsetsLabel : UILabel
@property (nonatomic, strong) UIView             *iconView;
@property (nonatomic)         UIEdgeInsets        edgeInsets;
@property (nonatomic)         CRJIconEdgeDirection  direction;
@property (nonatomic)         CGFloat             gap;

- (void)sizeToFitWithText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END

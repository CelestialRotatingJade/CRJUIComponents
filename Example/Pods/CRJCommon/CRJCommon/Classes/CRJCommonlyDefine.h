//
//  CRJCommonlyDefine.h
//  CRJCommon_Example
//
//  Created by zhuyuhui on 2020/8/30.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark - 系统参数
/// Get main screen's scale.
CGFloat CRJScreenScale(void);

/// Get main screen's size. Height is always larger than width.
CGSize CRJScreenSize(void);



#pragma mark - 非空判断
/// 字符串是否为空
static inline BOOL CRJIsBlankString(NSString *aStr){
    if (!aStr) {return YES;}
    if ([aStr isKindOfClass:[NSNull class]]) {return YES;}
    if (![aStr isKindOfClass:[NSString class]]) {return YES;}
    if (!aStr.length) {return YES;}

    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {return YES;}
    return NO;
}
/// 数组是否为空
static inline BOOL CRJIsBlankArr(NSArray *arr){
    if (!arr) {return YES;}
    if ([arr isKindOfClass:[NSNull class]]) {return YES;}
    if (![arr isKindOfClass:[NSArray class]]) {return YES;}
    if (!arr.count) {return YES;}
    return NO;
}
/// 字典是否为空
static inline BOOL CRJIsBlankDictionary(NSDictionary *dic){
    if (!dic) {return YES;}
    if ([dic isKindOfClass:[NSNull class]]) {return YES;}
    if (![dic isKindOfClass:[NSDictionary class]]) {return YES;}
    if (!dic.count) {return YES;}
    return NO;

}
/// 安全字符串
static inline NSString* CRJSafeStr(NSString *str){
    return CRJIsBlankString(str) ? @"" : str;
}


#pragma mark - 常用Block定义
typedef void (^CRJVoidBlock)(void);
typedef BOOL (^CRJBoolBlock)(void);
typedef int  (^CRJIntBlock) (void);
typedef id   (^CRJIDBlock)  (void);

typedef void (^CRJVoidBlock_int)(int);
typedef BOOL (^CRJBoolBlock_int)(int);
typedef int  (^CRJIntBlock_int) (int);
typedef id   (^CRJIDBlock_int)  (int);

typedef void (^CRJVoidBlock_string)(NSString *);
typedef BOOL (^CRJBoolBlock_string)(NSString *);
typedef int  (^CRJIntBlock_string) (NSString *);
typedef id   (^CRJIDBlock_string)  (NSString *);

typedef void (^CRJVoidBlock_id)(id);
typedef BOOL (^CRJBoolBlock_id)(id);
typedef int  (^CRJIntBlock_id) (id);
typedef id   (^CRJIDBlock_id)  (id);


#pragma mark - 数值计算

#ifndef CRJ_CLAMP // return the clamped value
#define CRJ_CLAMP(_x_, _low_, _high_)  (((_x_) > (_high_)) ? (_high_) : (((_x_) < (_low_)) ? (_low_) : (_x_)))
#endif


/// Convert degrees to radians.
CG_INLINE CGFloat CRJDegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;
}

/// Convert radians to degrees.
CG_INLINE CGFloat CRJRadiansToDegrees(CGFloat radians) {
    return radians * 180 / M_PI;
}

/// round point value for pixel-aligned
CG_INLINE CGFloat CRJCGFloatPixelRound(CGFloat value) {
    CGFloat scale = CRJScreenScale();
    return round(value * scale) / scale;
}

/// floor point value for pixel-aligned
CG_INLINE CGFloat CRJCGFloatPixelFloor(CGFloat value) {
    CGFloat scale = CRJScreenScale();
    return floor(value * scale) / scale;
}

/// round point value for pixel-aligned
CG_INLINE CGSize CRJCGSizePixelRound(CGSize size) {
    CGFloat scale = CRJScreenScale();
    return CGSizeMake(round(size.width * scale) / scale,
                      round(size.height * scale) / scale);
}

/// floor UIEdgeInset for pixel-aligned
CG_INLINE UIEdgeInsets CRJUIEdgeInsetPixelFloor(UIEdgeInsets insets) {
    insets.top = CRJCGFloatPixelFloor(insets.top);
    insets.left = CRJCGFloatPixelFloor(insets.left);
    insets.bottom = CRJCGFloatPixelFloor(insets.bottom);
    insets.right = CRJCGFloatPixelFloor(insets.right);
    return insets;
}

/// Get the transform rotation.
/// @return the rotation in radians [-PI,PI] ([-180°,180°])
CG_INLINE CGFloat CRJCGAffineTransformGetRotation(CGAffineTransform transform) {
    return atan2(transform.b, transform.a);
}

/// Get the transform's scale.x
CG_INLINE CGFloat CRJCGAffineTransformGetScaleX(CGAffineTransform transform) {
    return  sqrt(transform.a * transform.a + transform.c * transform.c);
}

/// Get the transform's scale.y
CG_INLINE CGFloat CRJCGAffineTransformGetScaleY(CGAffineTransform transform) {
    return sqrt(transform.b * transform.b + transform.d * transform.d);
}

/// Get the transform's translate.x
CG_INLINE CGFloat CRJCGAffineTransformGetTranslateX(CGAffineTransform transform) {
    return transform.tx;
}

/// Get the transform's translate.y
CG_INLINE CGFloat CRJCGAffineTransformGetTranslateY(CGAffineTransform transform) {
    return transform.ty;
}


/// Create a skew transform.
CG_INLINE CGAffineTransform CRJCGAffineTransformMakeSkew(CGFloat x, CGFloat y){
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform.c = -x;
    transform.b = y;
    return transform;
}

/// Negates/inverts a UIEdgeInsets.
CG_INLINE UIEdgeInsets CRJUIEdgeInsetsInvert(UIEdgeInsets insets) {
    return UIEdgeInsetsMake(-insets.top, -insets.left, -insets.bottom, -insets.right);
}


#pragma mark - CGFloat
/// Convert point to pixel.
CG_INLINE CGFloat CRJCGFloatToPixel(CGFloat value) {
    return value * CRJScreenScale();
}

/// Convert pixel to point.
CG_INLINE CGFloat CRJCGFloatFromPixel(CGFloat value) {
    return value / CRJScreenScale();
}
/**
 *  某些地方可能会将 CGFLOAT_MIN 作为一个数值参与计算（但其实 CGFLOAT_MIN 更应该被视为一个标志位而不是数值），可能导致一些精度问题，所以提供这个方法快速将 CGFLOAT_MIN 转换为 0
 *  issue: https://github.com/Tencent/QMUI_iOS/issues/203
 */
CG_INLINE CGFloat CRJremoveFloatMin(CGFloat floatValue) {
    return floatValue == CGFLOAT_MIN ? 0 : floatValue;
}

/**
 *  基于指定的倍数，对传进来的 floatValue 进行像素取整。若指定倍数为0，则表示以当前设备的屏幕倍数为准。
 *
 *  例如传进来 “2.1”，在 2x 倍数下会返回 2.5（0.5pt 对应 1px），在 3x 倍数下会返回 2.333（0.333pt 对应 1px）。
 */
CG_INLINE CGFloat CRJflatSpecificScale(CGFloat floatValue, CGFloat scale) {
    floatValue = CRJremoveFloatMin(floatValue);
    scale = scale ?: CRJScreenScale();
    CGFloat flattedValue = ceil(floatValue * scale) / scale;
    return flattedValue;
}

/**
 *  基于当前设备的屏幕倍数，对传进来的 floatValue 进行像素取整。
 *
 *  注意如果在 Core Graphic 绘图里使用时，要注意当前画布的倍数是否和设备屏幕倍数一致，若不一致，不可使用 flat() 函数，而应该用 flatSpecificScale
 */
CG_INLINE CGFloat CRJflat(CGFloat floatValue) {
    return CRJflatSpecificScale(floatValue, 0);
}

/**
 *  类似flat()，只不过 flat 是向上取整，而 floorInPixel 是向下取整
 */
CG_INLINE CGFloat CRJfloorInPixel(CGFloat floatValue) {
    floatValue = CRJremoveFloatMin(floatValue);
    CGFloat resultValue = floor(floatValue * CRJScreenScale()) / CRJScreenScale();
    return resultValue;
}

CG_INLINE BOOL CRJbetween(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue < value && value < maximumValue;
}

CG_INLINE BOOL CRJbetweenOrEqual(CGFloat minimumValue, CGFloat value, CGFloat maximumValue) {
    return minimumValue <= value && value <= maximumValue;
}

/**
 *  调整给定的某个 CGFloat 值的小数点精度，超过精度的部分按四舍五入处理。
 *
 *  例如 CGFloatToFixed(0.3333, 2) 会返回 0.33，而 CGFloatToFixed(0.6666, 2) 会返回 0.67
 *
 *  @warning 参数类型为 CGFloat，也即意味着不管传进来的是 float 还是 double 最终都会被强制转换成 CGFloat 再做计算
 *  @warning 该方法无法解决浮点数精度运算的问题
 */
CG_INLINE CGFloat CRJCGFloatToFixed(CGFloat value, NSUInteger precision) {
    NSString *formatString = [NSString stringWithFormat:@"%%.%@f", @(precision)];
    NSString *toString = [NSString stringWithFormat:formatString, value];
    #if CGFLOAT_IS_DOUBLE
    CGFloat result = [toString doubleValue];
    #else
    CGFloat result = [toString floatValue];
    #endif
    return result;
}

/// 用于居中运算
CG_INLINE CGFloat CRJCGFloatGetCenter(CGFloat parent, CGFloat child) {
    return CRJflat((parent - child) / 2.0);
}

/// 检测某个数值如果为 NaN 则将其转换为 0，避免布局中出现 crash
CG_INLINE CGFloat CRJCGFloatSafeValue(CGFloat value) {
    return isnan(value) ? 0 : value;
}

#pragma mark - CGPoint

/// 两个point相加
CG_INLINE CGPoint CRJCGPointUnion(CGPoint point1, CGPoint point2) {
    return CGPointMake(CRJflat(point1.x + point2.x), CRJflat(point1.y + point2.y));
}

/// 获取rect的center，包括rect本身的x/y偏移
CG_INLINE CGPoint CRJCGPointGetCenterWithRect(CGRect rect) {
    return CGPointMake(CRJflat(CGRectGetMidX(rect)), CRJflat(CGRectGetMidY(rect)));
}

CG_INLINE CGPoint CRJCGPointGetCenterWithSize(CGSize size) {
    return CGPointMake(CRJflat(size.width / 2.0), CRJflat(size.height / 2.0));
}

CG_INLINE CGPoint CRJCGPointToFixed(CGPoint point, NSUInteger precision) {
    CGPoint result = CGPointMake(CRJCGFloatToFixed(point.x, precision), CRJCGFloatToFixed(point.y, precision));
    return result;
}

CG_INLINE CGPoint CRJCGPointRemoveFloatMin(CGPoint point) {
    CGPoint result = CGPointMake(CRJremoveFloatMin(point.x), CRJremoveFloatMin(point.y));
    return result;
}

#pragma mark - UIEdgeInsets

/// 获取UIEdgeInsets在水平方向上的值
CG_INLINE CGFloat CRJUIEdgeInsetsGetHorizontalValue(UIEdgeInsets insets) {
    return insets.left + insets.right;
}

/// 获取UIEdgeInsets在垂直方向上的值
CG_INLINE CGFloat CRJUIEdgeInsetsGetVerticalValue(UIEdgeInsets insets) {
    return insets.top + insets.bottom;
}

/// 将两个UIEdgeInsets合并为一个
CG_INLINE UIEdgeInsets CRJUIEdgeInsetsConcat(UIEdgeInsets insets1, UIEdgeInsets insets2) {
    insets1.top += insets2.top;
    insets1.left += insets2.left;
    insets1.bottom += insets2.bottom;
    insets1.right += insets2.right;
    return insets1;
}

CG_INLINE UIEdgeInsets CRJUIEdgeInsetsSetTop(UIEdgeInsets insets, CGFloat top) {
    insets.top = CRJflat(top);
    return insets;
}

CG_INLINE UIEdgeInsets CRJUIEdgeInsetsSetLeft(UIEdgeInsets insets, CGFloat left) {
    insets.left = CRJflat(left);
    return insets;
}
CG_INLINE UIEdgeInsets CRJUIEdgeInsetsSetBottom(UIEdgeInsets insets, CGFloat bottom) {
    insets.bottom = CRJflat(bottom);
    return insets;
}

CG_INLINE UIEdgeInsets CRJUIEdgeInsetsSetRight(UIEdgeInsets insets, CGFloat right) {
    insets.right = CRJflat(right);
    return insets;
}

CG_INLINE UIEdgeInsets CRJUIEdgeInsetsToFixed(UIEdgeInsets insets, NSUInteger precision) {
    UIEdgeInsets result = UIEdgeInsetsMake(CRJCGFloatToFixed(insets.top, precision), CRJCGFloatToFixed(insets.left, precision), CRJCGFloatToFixed(insets.bottom, precision), CRJCGFloatToFixed(insets.right, precision));
    return result;
}

CG_INLINE UIEdgeInsets CRJUIEdgeInsetsRemoveFloatMin(UIEdgeInsets insets) {
    UIEdgeInsets result = UIEdgeInsetsMake(CRJremoveFloatMin(insets.top), CRJremoveFloatMin(insets.left), CRJremoveFloatMin(insets.bottom), CRJremoveFloatMin(insets.right));
    return result;
}

#pragma mark - CGSize

/// 判断一个 CGSize 是否存在 NaN
CG_INLINE BOOL CRJCGSizeIsNaN(CGSize size) {
    return isnan(size.width) || isnan(size.height);
}

/// 判断一个 CGSize 是否存在 infinite
CG_INLINE BOOL CRJCGSizeIsInf(CGSize size) {
    return isinf(size.width) || isinf(size.height);
}

/// 判断一个 CGSize 是否为空（宽或高为0）
CG_INLINE BOOL CRJCGSizeIsEmpty(CGSize size) {
    return size.width <= 0 || size.height <= 0;
}

/// 判断一个 CGSize 是否合法（例如不带无穷大的值、不带非法数字）
CG_INLINE BOOL CRJCGSizeIsValidated(CGSize size) {
    return !CRJCGSizeIsEmpty(size) && !CRJCGSizeIsInf(size) && !CRJCGSizeIsNaN(size);
}

/// 将一个 CGSize 像素对齐
CG_INLINE CGSize CRJCGSizeFlatted(CGSize size) {
    return CGSizeMake(CRJflat(size.width), CRJflat(size.height));
}

/// 将一个 CGSize 以 pt 为单位向上取整
CG_INLINE CGSize CRJCGSizeCeil(CGSize size) {
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

/// 将一个 CGSize 以 pt 为单位向下取整
CG_INLINE CGSize CRJCGSizeFloor(CGSize size) {
    return CGSizeMake(floor(size.width), floor(size.height));
}

CG_INLINE CGSize CRJCGSizeToFixed(CGSize size, NSUInteger precision) {
    CGSize result = CGSizeMake(CRJCGFloatToFixed(size.width, precision), CRJCGFloatToFixed(size.height, precision));
    return result;
}

CG_INLINE CGSize CRJCGSizeRemoveFloatMin(CGSize size) {
    CGSize result = CGSizeMake(CRJremoveFloatMin(size.width), CRJremoveFloatMin(size.height));
    return result;
}

#pragma mark - CGRect

/// 判断一个 CGRect 是否存在 NaN
CG_INLINE BOOL CRJCGRectIsNaN(CGRect rect) {
    return isnan(rect.origin.x) || isnan(rect.origin.y) || isnan(rect.size.width) || isnan(rect.size.height);
}

/// 系统提供的 CGRectIsInfinite 接口只能判断 CGRectInfinite 的情况，而该接口可以用于判断 INFINITY 的值
CG_INLINE BOOL CRJCGRectIsInf(CGRect rect) {
    return isinf(rect.origin.x) || isinf(rect.origin.y) || isinf(rect.size.width) || isinf(rect.size.height);
}

/// 判断一个 CGRect 是否合法（例如不带无穷大的值、不带非法数字）
CG_INLINE BOOL CRJCGRectIsValidated(CGRect rect) {
    return !CGRectIsNull(rect) && !CGRectIsInfinite(rect) && !CRJCGRectIsNaN(rect) && !CRJCGRectIsInf(rect);
}

/// 检测某个 CGRect 如果存在数值为 NaN 的则将其转换为 0，避免布局中出现 crash
CG_INLINE CGRect CRJCGRectSafeValue(CGRect rect) {
    return CGRectMake(CRJCGFloatSafeValue(CGRectGetMinX(rect)), CRJCGFloatSafeValue(CGRectGetMinY(rect)), CRJCGFloatSafeValue(CGRectGetWidth(rect)), CRJCGFloatSafeValue(CGRectGetHeight(rect)));
}

/// 创建一个像素对齐的CGRect
CG_INLINE CGRect CRJCGRectFlatMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(CRJflat(x), CRJflat(y), CRJflat(width), CRJflat(height));
}

/// 对CGRect的x/y、width/height都调用一次flat，以保证像素对齐
CG_INLINE CGRect CRJCGRectFlatted(CGRect rect) {
    return CGRectMake(CRJflat(rect.origin.x), CRJflat(rect.origin.y), CRJflat(rect.size.width), CRJflat(rect.size.height));
}

/// 计算目标点 targetPoint 围绕坐标点 coordinatePoint 通过 transform 之后此点的坐标
CG_INLINE CGPoint CRJCGPointApplyAffineTransformWithCoordinatePoint(CGPoint coordinatePoint, CGPoint targetPoint, CGAffineTransform t) {
    CGPoint p;
    p.x = (targetPoint.x - coordinatePoint.x) * t.a + (targetPoint.y - coordinatePoint.y) * t.c + coordinatePoint.x;
    p.y = (targetPoint.x - coordinatePoint.x) * t.b + (targetPoint.y - coordinatePoint.y) * t.d + coordinatePoint.y;
    p.x += t.tx;
    p.y += t.ty;
    return p;
}


/// 为一个CGRect叠加scale计算
CG_INLINE CGRect CRJCGRectApplyScale(CGRect rect, CGFloat scale) {
    return CRJCGRectFlatted(CGRectMake(CGRectGetMinX(rect) * scale, CGRectGetMinY(rect) * scale, CGRectGetWidth(rect) * scale, CGRectGetHeight(rect) * scale));
}

/// 计算view的水平居中，传入父view和子view的frame，返回子view在水平居中时的x值
CG_INLINE CGFloat CRJCGRectGetMinXHorizontallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return CRJflat((CGRectGetWidth(parentRect) - CGRectGetWidth(childRect)) / 2.0);
}

/// 计算view的垂直居中，传入父view和子view的frame，返回子view在垂直居中时的y值
CG_INLINE CGFloat CRJCGRectGetMinYVerticallyCenterInParentRect(CGRect parentRect, CGRect childRect) {
    return CRJflat((CGRectGetHeight(parentRect) - CGRectGetHeight(childRect)) / 2.0);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持垂直居中时，layoutingRect的originY
CG_INLINE CGFloat CRJCGRectGetMinYVerticallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinY(referenceRect) + CRJCGRectGetMinYVerticallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 返回值：同一个坐标系内，想要layoutingRect和已布局完成的referenceRect保持水平居中时，layoutingRect的originX
CG_INLINE CGFloat CRJCGRectGetMinXHorizontallyCenter(CGRect referenceRect, CGRect layoutingRect) {
    return CGRectGetMinX(referenceRect) + CRJCGRectGetMinXHorizontallyCenterInParentRect(referenceRect, layoutingRect);
}

/// 为给定的rect往内部缩小insets的大小
CG_INLINE CGRect CRJCGRectInsetEdges(CGRect rect, UIEdgeInsets insets) {
    rect.origin.x += insets.left;
    rect.origin.y += insets.top;
    rect.size.width -= CRJUIEdgeInsetsGetHorizontalValue(insets);
    rect.size.height -= CRJUIEdgeInsetsGetVerticalValue(insets);
    return rect;
}

/// 传入size，返回一个x/y为0的CGRect
CG_INLINE CGRect CRJCGRectMakeWithSize(CGSize size) {
    return CGRectMake(0, 0, size.width, size.height);
}

CG_INLINE CGRect CRJCGRectFloatTop(CGRect rect, CGFloat top) {
    rect.origin.y = top;
    return rect;
}

CG_INLINE CGRect CRJCGRectFloatBottom(CGRect rect, CGFloat bottom) {
    rect.origin.y = bottom - CGRectGetHeight(rect);
    return rect;
}

CG_INLINE CGRect CRJCGRectFloatRight(CGRect rect, CGFloat right) {
    rect.origin.x = right - CGRectGetWidth(rect);
    return rect;
}

CG_INLINE CGRect CRJCGRectFloatLeft(CGRect rect, CGFloat left) {
    rect.origin.x = left;
    return rect;
}

/// 保持rect的左边缘不变，改变其宽度，使右边缘靠在right上
CG_INLINE CGRect CRJCGRectLimitRight(CGRect rect, CGFloat rightLimit) {
    rect.size.width = rightLimit - rect.origin.x;
    return rect;
}

/// 保持rect右边缘不变，改变其宽度和origin.x，使其左边缘靠在left上。只适合那种右边缘不动的view
/// 先改变origin.x，让其靠在offset上
/// 再改变size.width，减少同样的宽度，以抵消改变origin.x带来的view移动，从而保证view的右边缘是不动的
CG_INLINE CGRect CRJCGRectLimitLeft(CGRect rect, CGFloat leftLimit) {
    CGFloat subOffset = leftLimit - rect.origin.x;
    rect.origin.x = leftLimit;
    rect.size.width = rect.size.width - subOffset;
    return rect;
}

/// 限制rect的宽度，超过最大宽度则截断，否则保持rect的宽度不变
CG_INLINE CGRect CRJCGRectLimitMaxWidth(CGRect rect, CGFloat maxWidth) {
    CGFloat width = CGRectGetWidth(rect);
    rect.size.width = width > maxWidth ? maxWidth : width;
    return rect;
}

CG_INLINE CGRect CRJCGRectSetX(CGRect rect, CGFloat x) {
    rect.origin.x = CRJflat(x);
    return rect;
}

CG_INLINE CGRect CRJCGRectSetY(CGRect rect, CGFloat y) {
    rect.origin.y = CRJflat(y);
    return rect;
}

CG_INLINE CGRect CRJCGRectSetXY(CGRect rect, CGFloat x, CGFloat y) {
    rect.origin.x = CRJflat(x);
    rect.origin.y = CRJflat(y);
    return rect;
}

CG_INLINE CGRect CRJCGRectSetWidth(CGRect rect, CGFloat width) {
    if (width < 0) {
        return rect;
    }
    rect.size.width = CRJflat(width);
    return rect;
}

CG_INLINE CGRect CRJCGRectSetHeight(CGRect rect, CGFloat height) {
    if (height < 0) {
        return rect;
    }
    rect.size.height = CRJflat(height);
    return rect;
}

CG_INLINE CGRect CRJCGRectSetSize(CGRect rect, CGSize size) {
    rect.size = CRJCGSizeFlatted(size);
    return rect;
}

CG_INLINE CGRect CRJCGRectToFixed(CGRect rect, NSUInteger precision) {
    CGRect result = CGRectMake(CRJCGFloatToFixed(CGRectGetMinX(rect), precision),
                               CRJCGFloatToFixed(CGRectGetMinY(rect), precision),
                               CRJCGFloatToFixed(CGRectGetWidth(rect), precision),
                               CRJCGFloatToFixed(CGRectGetHeight(rect), precision));
    return result;
}

CG_INLINE CGRect CRJCGRectRemoveFloatMin(CGRect rect) {
    CGRect result = CGRectMake(CRJremoveFloatMin(CGRectGetMinX(rect)),
                               CRJremoveFloatMin(CGRectGetMinY(rect)),
                               CRJremoveFloatMin(CGRectGetWidth(rect)),
                               CRJremoveFloatMin(CGRectGetHeight(rect)));
    return result;
}

/// outerRange 是否包含了 innerRange
CG_INLINE BOOL CRJNSContainingRanges(NSRange outerRange, NSRange innerRange) {
    if (innerRange.location >= outerRange.location && outerRange.location + outerRange.length >= innerRange.location + innerRange.length) {
        return YES;
    }
    return NO;
}

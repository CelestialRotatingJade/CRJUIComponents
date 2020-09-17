//
//  CRJPlaceholderImageView.h
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>
@interface CRJPlaceholderImageView : UIView
/**
 *  Picture's url string.
 */
@property (nonatomic, strong) NSString *urlString;

/**
 *  The placeholder's image.
 */
@property (nonatomic, strong) UIImage  *placeholderImage;

/**
 *  Default is UIViewContentModeScaleAspectFill.
 */
@property (nonatomic) UIViewContentMode placeholderImageContentMode;

/**
 *  Default is UIViewContentModeScaleAspectFill.
 */
@property (nonatomic) UIViewContentMode contentImageContentMode;

@end


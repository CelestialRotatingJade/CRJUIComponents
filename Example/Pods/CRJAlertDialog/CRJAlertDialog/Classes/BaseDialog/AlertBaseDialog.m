//
//  AlertBaseDialog.m
//  CloudClaim
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/14.
//  Copyright © 2020 朱敏(保险支持团队保险研发组). All rights reserved.
//

#import "AlertBaseDialog.h"
@interface AlertBaseDialog ()

@end

@implementation AlertBaseDialog

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.view.layer.borderColor = [UIColor redColor].CGColor;
//    self.view.layer.borderWidth = 2;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ viewWillAppear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogWillShow:)]) {
        [self.delegate baseDialogWillShow:self];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ viewDidAppear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogDidShow:)]) {
        [self.delegate baseDialogDidShow:self];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ viewWillDisappear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogWillHide:)]) {
        [self.delegate baseDialogWillHide:self];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ viewDidDisappear.", NSStringFromClass([self class]));
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseDialogDidHide:)]) {
        [self.delegate baseDialogDidHide:self];
    }
}

- (void)dealloc {
    NSLog(@"%@ dealloc.", NSStringFromClass([self class]));
}

+ (TransitionAnimator *)defaultAnimator {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;

    DLAnimationBottom *animator = [[DLAnimationBottom alloc] init];
    animator.contentWidthRatio = 1.0f;
    animator.contentHeightRatio = (222.f + 40.f + [DLAnimationBottom fringeScreenBottomSafeHeight]) / screenH;
    return animator;
}

- (UIImage *)imageFromCustomBundle:(NSString *)name {
    NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
        stringByAppendingPathComponent:@"/CRJAlertDialog.bundle"];
    NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:name
                                inBundle:resource_bundle
           compatibleWithTraitCollection:nil];
    return image;
}
#pragma mark - Chain Programming.
+ (instancetype)build {
    return [[[self class] alloc] init];
}

- (AlertBaseDialog *(^)(NSInteger tag))withTag {
    return ^ AlertBaseDialog * (NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

- (AlertBaseDialog *(^)(TransitionAnimator *animator))withAnimator {
    return ^ AlertBaseDialog * (TransitionAnimator *animator) {
        self.animator = animator;
        return self;
    };
}

- (AlertBaseDialog *(^)(id object))withObject {
    return ^ AlertBaseDialog * (id object) {
        self.object = object;
        return self;
    };
}

- (AlertBaseDialog *(^)(id <AlertBaseDialogDelegate> delegate))withDelegate {
    return ^ AlertBaseDialog * (id <AlertBaseDialogDelegate> delegate) {
        self.delegate = delegate;
        return self;
    };
}

- (AlertBaseDialog *(^)(id info))withInfo {
    return ^ AlertBaseDialog * (id info) {
        self.info = info;
        return self;
    };
}

- (AlertBaseDialog *(^)(id selectedItem))withSelectedItem {
    return ^ AlertBaseDialog * (id selectedItem) {
        self.selectedItem = selectedItem;
        return self;
    };
}

- (AlertBaseDialog *(^)(NSArray *showDatas))withShowDatas {
    return ^ AlertBaseDialog * (NSArray *showDatas) {
        self.showDatas = showDatas;
        return self;
    };
}

- (AlertBaseDialog *(^)(void))prepareFinish {
    return ^ AlertBaseDialog * (void) {
        if (!self.animator) {
            self.animator = [[self class] defaultAnimator];
        }
        return self;
    };
}

#pragma mark - 懒加载
@end

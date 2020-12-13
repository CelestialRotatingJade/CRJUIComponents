//
//  CRJAlertBaseDialog.m
//  Pods
//
//  Created by zhuyuhui on 2020/12/12.
//

#import "CRJAlertBaseDialog.h"

@interface CRJAlertBaseDialog ()

@end

@implementation CRJAlertBaseDialog

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    TransitionAnimator *animator = [[TransitionAnimator alloc] init];
    return animator;
}

#pragma mark - Chain Programming.
+ (instancetype)build {
    return [[[self class] alloc] init];
}

- (CRJAlertBaseDialog *(^)(NSInteger tag))withTag {
    return ^ CRJAlertBaseDialog * (NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(TransitionAnimator *animator))withAnimator {
    return ^ CRJAlertBaseDialog * (TransitionAnimator *animator) {
        self.animator = animator;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(id object))withObject {
    return ^ CRJAlertBaseDialog * (id object) {
        self.object = object;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(id <CRJAlertBaseDialogDelegate> delegate))withDelegate {
    return ^ CRJAlertBaseDialog * (id <CRJAlertBaseDialogDelegate> delegate) {
        self.delegate = delegate;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(id info))withInfo {
    return ^ CRJAlertBaseDialog * (id info) {
        self.info = info;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(id selectedItem))withSelectedItem {
    return ^ CRJAlertBaseDialog * (id selectedItem) {
        self.selectedItem = selectedItem;
        return self;
    };
}

- (CRJAlertBaseDialog *(^)(NSArray *showDatas))withShowDatas {
    return ^ CRJAlertBaseDialog * (NSArray *showDatas) {
        self.showDatas = showDatas;
        return self;
    };
}


@end

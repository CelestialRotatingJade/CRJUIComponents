//
//  CRJBaseShowPickerView.m
//  CRJShowPickerView
//
//  Created by zhuyuhui on 2020/9/13.
//

#import "CRJBaseShowPickerView.h"

@interface CRJBaseShowPickerView ()

@property (nonatomic, strong) UIView   *contentView;
@property (nonatomic, weak)   UIWindow *keyWindow;
@property (nonatomic, strong) UIButton *backgroundButton;

@end

@implementation CRJBaseShowPickerView

- (void)prepare {
    
    // 获取keywindow
    self.keyWindow = [UIApplication sharedApplication].keyWindow;
    NSParameterAssert(self.keyWindow);
    
    // 创建背景的按钮
    self.frame                            = self.keyWindow.bounds;
    self.backgroundButton                 = [[UIButton alloc] initWithFrame:self.keyWindow.bounds];
    self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.f];
    [self.backgroundButton addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backgroundButton];
    
    // 创建contentView
    CGRect frame                     = CGRectMake(0, self.keyWindow.frame.size.height, self.keyWindow.frame.size.width, [[self class] contentViewHeight]);
    self.contentView                 = [[UIView alloc] initWithFrame:frame];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentView];
    
    // 在contentView里面添加显示的view
    [self buildViewsInContentView:self.contentView];
    
    // 对picker进行配置
    [self configPicker];
}

- (void)buildViewsInContentView:(UIView *)contentView {
    
    // Overwrite by subclass.
}

- (void)configPicker {
    
    // Overwrite by subclass.
}

+ (instancetype)showPickerViewWithDelegate:(id <CRJBaseShowPickerViewDelegate>)delegate
                                       tag:(NSInteger)tag
                                    object:(id)object
                                      info:(id)info
                              selectedItem:(id)selectedItem
                                 showDatas:(NSArray *)showDatas {
    
    CRJBaseShowPickerView *pickerView = [[self class] new];
    pickerView.delegate            = delegate;
    pickerView.tag                 = tag;
    pickerView.object              = object;
    pickerView.info                = info;
    pickerView.selectedItem        = selectedItem;
    pickerView.showDatas           = showDatas;
    
    [pickerView prepare];
    [pickerView showInKeyWindow];
    
    return pickerView;
}

- (void)showInKeyWindow {
    
    [self.keyWindow addSubview:self];
    
    // 代理 - 将要显示
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerViewWillShow:)]) {
    
        [self.delegate baseShowPickerViewWillShow:self];
    }
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.25f];
        self.contentView.frame                = CGRectMake(0,
                                                           self.keyWindow.frame.size.height - [[self class] contentViewHeight],
                                                           self.keyWindow.frame.size.width,
                                                           [[self class] contentViewHeight]);
        
    } completion:^(BOOL finished) {
        
        // 代理 - 已经显示
        if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerViewDidShow:)]) {
            
            [self.delegate baseShowPickerViewDidShow:self];
        }
    }];
}

- (void)hideFromKeyWindow {
    
    // 代理 - 将要消失
    if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerViewWillHide:)]) {
        
        [self.delegate baseShowPickerViewWillHide:self];
    }
    
    [UIView animateWithDuration:0.35f animations:^{
        
        self.backgroundButton.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.f];
        self.contentView.frame                = CGRectMake(0, self.keyWindow.frame.size.height, self.keyWindow.frame.size.width, [[self class] contentViewHeight]);
        
    } completion:^(BOOL finished) {
        
        // 代理 - 已经消失
        if (self.delegate && [self.delegate respondsToSelector:@selector(baseShowPickerViewDidHide:)]) {
            
            [self.delegate baseShowPickerViewDidHide:self];
        }
        
        self.keyWindow = nil;
        [self removeFromSuperview];
    }];
}

- (void)buttonEvent:(UIButton *)button {
    
    [self hideFromKeyWindow];
}

+ (CGFloat)contentViewHeight {
    
    return 0;
}

- (void)dealloc {
    
    NSLog(@"%@ dealloc.", NSStringFromClass([self class]));
}

#pragma mark - Chain Programming.

+ (instancetype)build {
    
    return [[self class] new];
}

- (CRJBaseShowPickerView *(^)(NSInteger tag))withTag {
    
    return ^ CRJBaseShowPickerView * (NSInteger tag) {
        
        self.tag = tag;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(id object))withObject {
    
    return ^ CRJBaseShowPickerView * (id object) {
        
        self.object = object;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(id <CRJBaseShowPickerViewDelegate> delegate))withDelegate {
    
    return ^ CRJBaseShowPickerView * (id <CRJBaseShowPickerViewDelegate> delegate) {
        
        self.delegate = delegate;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(id info))withInfo {
    
    return ^ CRJBaseShowPickerView * (id info) {
        
        self.info = info;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(id selectedItem))withSelectedItem {
    
    return ^ CRJBaseShowPickerView * (id selectedItem) {
        
        self.selectedItem = selectedItem;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(NSArray *showDatas))withShowDatas {
    
    return ^ CRJBaseShowPickerView * (NSArray *showDatas) {
        
        self.showDatas = showDatas;
        
        return self;
    };
}

- (CRJBaseShowPickerView *(^)(void))prepareAndShowInKeyWindow {
    
    return ^ CRJBaseShowPickerView * (void) {
        
        [self prepare];
        [self showInKeyWindow];
        
        return self;
    };
}

@end



//
//  CRJBaseViewScreen.m
//  CRJKit
//
//  Created by zhuyuhui on 2020/9/14.
//

#import "CRJBaseViewScreen.h"

@interface CRJBaseViewScreen ()
/// Custom AppBar
@property (nonatomic, strong, readwrite) CRJAppBar *appBar;
/// Custom View
@property (nonatomic, strong, readwrite) UIView *contentView;
/// The backBtn
@property (nonatomic, strong, readwrite) UIButton *backItem;

@end

@implementation CRJBaseViewScreen

///---------------🔥life cycle 生命周期
- (void)dealloc{
#ifdef DEBUG
    NSLog(@"dealloc %@",[self class]);
#else
    
#endif
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    [self initSubviews];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupNavigationItems];
    [self setupToolbarItems];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.contentView.frame = self.view.bounds;
    BOOL IsPortrait = CRJDeviceInfo.isPortrait;//是否是竖屏
    CGFloat safeAreaTop = 0;
    if (IsPortrait) {
        safeAreaTop = CRJDeviceInfo.safeAreaInsets.top;
    } else {
        safeAreaTop = 0;
    }
    CGFloat appBarH = safeAreaTop + [CRJAppearanceConfigure sharedInstance].navigationBarHeight;
    self.appBar.frame = CGRectMake(0, 0, self.view.width, appBarH);
}

#pragma mark - 添加视图
- (void)setup{
    self.fd_prefersNavigationBarHidden = YES;
}

- (void)initSubviews{
    self.contentView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.contentView.backgroundColor = [CRJAppearanceConfigure sharedInstance].scaffoldBackgroundColor;
    [self.view addSubview:self.contentView];

    
    self.appBar = [[CRJAppBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 44)];
    [self.view addSubview:self.appBar];
    [self.view insertSubview:self.appBar aboveSubview:self.contentView];

    self.appBar.titleLabel.text = self.title;
}

- (void)setupNavigationItems{
    if (self.navigationController.viewControllers.count > 1) {
        NSMutableArray *leftBarButtonItems = [NSMutableArray array];
        {
            [leftBarButtonItems addObject:self.backItem];
        }
        self.appBar.leftBarButtonItems = leftBarButtonItems;
    }
}

- (void)setupToolbarItems{}

///---------------🔥辅助方法
- (void)setTitle:(NSString *)title{
    [super setTitle:title];
    self.appBar.titleLabel.text = title;
}

#pragma mark - 事件处理
- (void)backItemDidClicked {
    /// 判断 是Push还是Present进来的，
    if (self.presentingViewController) {
        if (self.navigationController) {
            [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
        } else {
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark - getter setter
- (UIButton *)backItem{
    if (!_backItem) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [CRJAppearanceConfigure sharedInstance].navigationBarHeight, [CRJAppearanceConfigure sharedInstance].navigationBarHeight)];
        [btn setImage:CRJAppearanceConfigure.sharedInstance.topbar_back_image forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backItemDidClicked) forControlEvents:UIControlEventTouchUpInside];
        _backItem = btn;
    }
    return _backItem;
}




#pragma mark - Orientation
//是否跟随屏幕旋转
- (BOOL)shouldAutorotate{
    return NO;
}
//支持旋转的方向有哪些
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return (UIInterfaceOrientationMaskPortrait);
}
//控制 vc present进来的横竖屏和进入方向 ，支持的旋转方向必须包含改返回值的方向 （详细的说明见下文）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Status bar
- (BOOL)prefersStatusBarHidden{
    return NO;
}
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return UIStatusBarAnimationFade;
}
@end

//
//  CRJViewController.m
//  CRJUIComponents
//
//  Created by zhuyuhui434@gmail.com on 09/06/2020.
//  Copyright (c) 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "CRJViewController.h"
#import <CRJUIComponents/CRJUIComponents.h>

@interface CRJViewController ()

@end

@implementation CRJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    CRJRoundingCornerView *scr = [[CRJRoundingCornerView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    scr.rectCorner  = UIRectCornerAllCorners;
    scr.cornerRadii = CGSizeMake(25, 50);
    [self.view addSubview:scr];
    
    
    UIImageView *IMGVIEW = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    IMGVIEW.image = [UIImage imageNamed:@"IMAGE1.jpg"];
    [scr addSubview:IMGVIEW];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        scr.rectCorner  = UIRectCornerTopLeft;
    });
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

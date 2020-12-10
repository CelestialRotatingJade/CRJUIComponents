//
//  TNTComponentsScreen.m
//  CRJUIComponents_Example
//
//  Created by 朱玉辉(EX-ZHUYUHUI001) on 2020/12/10.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "TNTComponentsScreen.h"
#import "TNTComponentCell.h"
#import "TNTItemStyle.h"
#import "SingleChoicePickerView.h"

@interface TNTComponentsScreen ()
@property(nonatomic, strong) NSMutableArray <TNTItemStyle *>*objects;
@end

@implementation TNTComponentsScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // 步骤1：
    self.recylerView.rowHeight = UITableViewAutomaticDimension;
    // 步骤2：
    self.recylerView.estimatedRowHeight = 100.0;

}
#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    TNTComponentCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TNTComponentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    TNTItemStyle *style = [self.objects objectAtIndex:indexPath.row];
    cell.contentLabel.text = style.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TNTItemStyle *style = [self.objects objectAtIndex:indexPath.row];
    
    UIViewController *screen = [[style.controller alloc] init];
    screen.title = style.title;
    [self.navigationController pushViewController:screen animated:YES];
    
    SingleChoicePickerView.build.withObject(self).withDelegate(self).withInfo(@"请选择").withSelectedItem(nil).withShowDatas(@[@"sdsd",@"dsda",@"4342"]).prepareAndShowInKeyWindow();

}



- (NSMutableArray<TNTItemStyle *> *)objects {
    if (!_objects) {
        _objects = [NSMutableArray array];
        [_objects addObject:[TNTItemStyle create:^(TNTItemStyle * _Nonnull style) {
            style.title = @"DateItemPickerView";
            style.controller = NSClassFromString(@"TNTDateItemPickerViewScreen");
        }]];
    }
    return _objects;
}

@end

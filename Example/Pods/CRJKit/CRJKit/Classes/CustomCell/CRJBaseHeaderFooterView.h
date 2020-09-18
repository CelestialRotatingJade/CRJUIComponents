//
//  CRJBaseHeaderFooterView.h
//  Pods
//
//  Created by zhuyuhui on 2020/9/18.
//

#import <UIKit/UIKit.h>
#import <CRJCommon/CRJCommon.h>

@class CRJBaseHeaderFooterView;

@protocol CRJBaseHeaderFooterViewDelegate <NSObject>

@optional

/**
 *  CRJBaseHeaderFooterView's event.
 *
 *  @param customHeaderFooterView CRJBaseHeaderFooterView object.
 *  @param event                  Event data.
 */
- (void)crjHeaderFooterView:(CRJBaseHeaderFooterView *)customHeaderFooterView event:(id)event;

@end
@interface CRJBaseHeaderFooterView : UITableViewHeaderFooterView

#pragma mark - Propeties.

/**
 *  CRJBaseHeaderFooterView's delegate.
 */
@property (nonatomic, weak) id <CRJBaseHeaderFooterViewDelegate> delegate;

/**
 *  CRJBaseHeaderFooterView's dataAdapter.
 */
@property (nonatomic, weak) CRJCellHFDataAdapter *dataAdapter;

/**
 *  CustomHeaderFooterView's data.
 */
@property (nonatomic, weak) id data;

/**
 *  UITableView's section.
 */
@property (nonatomic) NSInteger section;

/**
 *  TableView.
 */
@property (nonatomic, weak) UITableView *tableView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

#pragma mark - Some useful method.

/**
 *  Set HeaderFooterView backgroundColor.
 *
 *  @param color Color.
 */
- (void)setHeaderFooterViewBackgroundColor:(UIColor *)color;

/**
 *  Register to tableView with the reuseIdentifier you specified.
 *
 *  @param tableView       TableView.
 *  @param reuseIdentifier The cell reuseIdentifier.
 */
+ (void)registerToTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier;

/**
 *  Register to tableView with the The class name.
 *
 *  @param tableView       TableView.
 */
+ (void)registerToTableView:(UITableView *)tableView;

#pragma mark - Method override by subclass.

/**
 *  Setup HeaderFooterView, override by subclass.
 */
- (void)setupHeaderFooterView;

/**
 *  Build subview, override by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, override by subclass.
 */
- (void)loadContent;

/**
 *  Calculate the cell's from data, overwrite by subclass.
 *
 *  @param data Data.
 *
 *  @return HeaderFooterView's height.
 */
+ (CGFloat)heightWithData:(id)data;

@end

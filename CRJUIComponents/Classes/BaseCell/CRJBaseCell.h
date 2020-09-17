//
//  CRJBaseCell.h
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>
#import <CRJCommon/CRJCommon.h>
@class CRJBaseCell;

@protocol CRJBaseCellDelegate <NSObject>

@optional

/**
 *  CRJBaseCell's event.
 *
 *  @param cell  CRJBaseCell type class.
 *  @param event Event data.
 */
- (void)crjBaseCell:(CRJBaseCell *)cell event:(id)event;

@end
@interface CRJBaseCell : UITableViewCell
#pragma mark - Propeties.

/**
 *  CustomCell's delegate.
 */
@property (nonatomic, weak) id <CRJBaseCellDelegate> delegate;

/**
 *  CustomCell's dataAdapter.
 */
@property (nonatomic, weak) CRJCellDataAdapter *dataAdapter;

/**
 *  CustomCell's data.
 */
@property (nonatomic, weak) id data;

/**
 *  CustomCell's indexPath.
 */
@property (nonatomic, weak) NSIndexPath *indexPath;

/**
 *  TableView.
 */
@property (nonatomic, weak) UITableView *tableView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *  Cell is showed or not, you can set this property in UITableView's method 'tableView:willDisplayCell:forRowAtIndexPath:' & 'tableView:didEndDisplayingCell:forRowAtIndexPath:' at runtime.
 */
@property (nonatomic) BOOL display;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, overwrite by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, overwrite by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, overwrite by subclass.
 */
- (void)loadContent;

/**
 *  Calculate the cell's height from data, overwrite by subclass.
 *
 *  @param data Data.
 *
 *  @return Cell's height.
 */
+ (CGFloat)cellHeightWithData:(id)data;

#pragma mark - Useful method.

/**
 *  Update the cell's height with animated or not, before you use this method, you should have the weak reference 'tableView' and 'dataAdapter', and this method will update the weak reference dataAdapter's property cellHeight.
 *
 *  @param height   The new cell height.
 *  @param animated Animated or not.
 */
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated;

/**
 *  Selected event, you should use this method in 'tableView:didSelectRowAtIndexPath:' to make it effective.
 */
- (void)selectedEvent;

/**
 *  Used for delegate event.
 */
- (void)delegateEvent;
@end

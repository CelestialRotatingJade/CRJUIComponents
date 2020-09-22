//
//  CRJBaseCLVCell.h
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import <UIKit/UIKit.h>
#import "CRJCellDataAdapter.h"
@class CRJBaseCLVCell;

@protocol CRJBaseCLVCellDelegate <NSObject>
@optional
/**
 *  CRJBaseCLVCell's event.
 *
 *  @param cell  CRJBaseCLVCell
 *  @param event Event.
 */
- (void)crjBaseCLVCell:(CRJBaseCLVCell *)cell event:(id)event;

@end
@interface CRJBaseCLVCell : UICollectionViewCell

/**
 *  CustomCollectionCell's delegate.
 */
@property (nonatomic, weak) id <CRJBaseCLVCellDelegate> delegate;

/**
 *  CustomCell's data.
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
@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  Controller.
 */
@property (nonatomic, weak) UIViewController *controller;

/**
 *  Cell is showed or not, you can set this property in UICollectionView's method 'collectionView:willDisplayCell:forItemAtIndexPath:' at runtime.
 */
@property (nonatomic) BOOL display;

#pragma mark - Method you should overwrite.

/**
 *  Setup cell, override by subclass.
 */
- (void)setupCell;

/**
 *  Build subview, override by subclass.
 */
- (void)buildSubview;

/**
 *  Load content, override by subclass.
 */
- (void)loadContent;

/**
 *  The content offset, override by subclass.
 */
- (void)contentOffset:(CGPoint)offset;

#pragma mark - Useful method.

/**
 *  Selected event, override by subclass.
 */
- (void)selectedEvent;

/**
 *  Register to collectionView with the reuseIdentifier you specified.
 *
 *  @param collectionView  CollectionView.
 *  @param reuseIdentifier The cell reuseIdentifier.
 */
+ (void)registerToCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier;

/**
 *  Register to collectionView with the The class name.
 *
 *  @param collectionView  collectionView.
 */
+ (void)registerToCollectionView:(UICollectionView *)collectionView;


@end

//
//  CRJCellHFDataAdapter.h
//  CRJCommon
//
//  Created by zhuyuhui on 2020/9/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CRJCellHFDataAdapter : NSObject

/**
 *  Cell header or footer's reused identifier.
 */
@property (nonatomic, copy) NSString *reuseIdentifier;

/**
 *  Data, can be nil.
 */
@property (nonatomic, strong) id data;

/**
 *  Cell header or footer's height, only used for UITableView's cell.
 */
@property (nonatomic) CGFloat height;

/**
 *  Section value.
 */
@property (nonatomic) NSInteger section;

/**
 *  CellHeader or CellFooter's type (The same header or footer, but maybe have different types).
 */
@property (nonatomic) NSInteger type;

/**
 *  Constructor.
 *
 *  @param reuseIdentifier Cell header or footer's reused identifier.
 *  @param data Data, can be nil.
 *  @param height Cell header or footer's height, only used for UITableView's cell.
 *  @param type CellHeader or CellFooter's type (The same header or footer, but maybe have different types).
 *
 *  @return CRJCellHFDataAdapter
 */
+ (instancetype)adapterWithReuseIdentifier:(NSString *)reuseIdentifier
                                      data:(id)data
                                    height:(CGFloat)height
                                      type:(NSInteger)type;

#pragma mark - Optional properties.

/**
 *  The tableView.
 */
@property (nonatomic, weak)   UITableView       *tableView;

/**
 *  The collectionView.
 */
@property (nonatomic, weak)   UICollectionView  *collectionView;

/**
 *  TableView's indexPath.
 */
@property (nonatomic, weak)   NSIndexPath       *indexPath;

@end

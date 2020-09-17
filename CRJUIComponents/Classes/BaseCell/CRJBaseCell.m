//
//  CRJBaseCell.m
//  CRJUIComponents
//
//  Created by zhuyuhui on 2020/9/17.
//

#import "CRJBaseCell.h"

@implementation CRJBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupCell];
    
    [self buildSubview];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

+ (CGFloat)cellHeightWithData:(id)data {
    return 0.f;
}

#pragma mark - Useful method.
- (void)updateWithNewCellHeight:(CGFloat)height animated:(BOOL)animated {
    if (_tableView && _dataAdapter) {
        if (animated) {
            _dataAdapter.cellHeight = height;
            [_tableView beginUpdates];
            [_tableView endUpdates];
            
        } else {
            
            _dataAdapter.cellHeight = height;
            [_tableView reloadData];
        }
    }
}

- (void)selectedEvent {
    [self delegateEvent];
}

- (void)delegateEvent {
    if (self.delegate && [self.delegate respondsToSelector:@selector(crjBaseCell:event:)]) {
        [self.delegate crjBaseCell:self event:self.data];
    }
}
@end

//
//  CommentCell.m
//  Chally
//
//  Created by Vardan Abrahamyan on 4/5/15.
//
//

#import "CommentCell.h"

@implementation CommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        
        [self.contentView addSubview:self.parentView];
        [self.parentView addSubview:self.userImageButton];
        [self.parentView addSubview:self.commentTextLabel];
        [self.parentView addSubview:self.dateLabel];
        [self.parentView addSubview:self.reportButton];
        [self.parentView addSubview:self.deleteButton];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

#pragma mark - Update Constraints

- (void)updateConstraints
{
    if (!self.updateConstraint) {
        
        [self.parentView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:-3];
        [self.parentView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        
        [self.userImageButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(NF_INSET)];
        [self.userImageButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(NF_INSET)];
        [self.userImageButton autoSetDimensionsToSize:CGSizeMake(PD_IMG_SIZE, PD_IMG_SIZE)];
        
        [self.commentTextLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.5*(NF_INSET)];
        [self.commentTextLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.userImageButton withOffset:NF_INSET];
        [self.commentTextLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.deleteButton];
        
        [self.reportButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.reportButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.dateLabel];
        [self.reportButton autoSetDimension:ALDimensionHeight toSize:4*(NF_INSET)];
        
        [self.dateLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.reportButton withOffset:(NF_INSET)];
        [self.dateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.commentTextLabel withOffset:1.3*(NF_INSET)];
        [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:(NF_INSET)];
        
        [self.deleteButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:3 - (NF_INSET)];
        [self.deleteButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
        [self.deleteButton autoSetDimensionsToSize:CGSizeMake(4*(NF_INSET), 4*(NF_INSET))];
        self.deleteButton.imageEdgeInsets = UIEdgeInsetsMake(NF_INSET, NF_INSET, NF_INSET, NF_INSET);
        
        self.updateConstraint = YES;
    }
    
    //ReportButton Width
    [self.widthReportButtonConstraint autoRemove];
    if (self.isReport) {
        self.widthReportButtonConstraint = [self.reportButton autoSetDimension:ALDimensionWidth toSize:4*(NF_INSET)];
    } else {
        self.widthReportButtonConstraint = [self.reportButton autoSetDimension:ALDimensionWidth toSize:2*(NF_INSET)];
    }
    
    [super updateConstraints];
}

#pragma mark - Initializations

- (UIView *)parentView
{
    if (!_parentView) {
        _parentView = [UIView newAutoLayoutView];
        _parentView.backgroundColor = [UIColor whiteColor];
        _parentView.layer.borderWidth = .5f;
        _parentView.layer.borderColor = GRAY_POST_CORNER.CGColor;
    }
    
    return _parentView;
}

- (UIButton *)userImageButton
{
    if (!_userImageButton) {
        _userImageButton = [UIButton newAutoLayoutView];
        //        [_userImageButton setImage:[UIImage imageNamed:@"ic_user"] forState:UIControlStateNormal];
        _userImageButton.layer.cornerRadius = (PD_IMG_SIZE)/2;
        _userImageButton.clipsToBounds = YES;
    }
    
    return _userImageButton;
}

- (UILabel *)commentTextLabel
{
    if (!_commentTextLabel) {
        _commentTextLabel = [UILabel newAutoLayoutView];
        _commentTextLabel.numberOfLines = 0;
        _commentTextLabel.font = PD_COMMENT_TEXT_FONT;
    }
    
    return _commentTextLabel;
}

- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [UILabel newAutoLayoutView];
        [_dateLabel setFont:PD_COMMENT_DATE_FONT];
    }
    
    return _dateLabel;
}

- (UIButton *)reportButton
{
    if (!_reportButton) {
        _reportButton = [UIButton newAutoLayoutView];
        _reportButton.imageEdgeInsets = UIEdgeInsetsMake((NF_INSET), NF_INSET, NF_INSET, NF_INSET);
        [_reportButton setImage:[UIImage imageNamed:@"ic_report_default"] forState:UIControlStateNormal];
        [_reportButton setImage:[UIImage imageNamed:@"ic_report_highlighted"] forState:UIControlStateHighlighted];
        [_reportButton setHidden:YES];
    }
    
    return _reportButton;
}

- (UIButton *)deleteButton
{
    if (!_deleteButton) {
        _deleteButton = [UIButton newAutoLayoutView];
        _deleteButton.imageEdgeInsets = UIEdgeInsetsMake(NF_INSET, NF_INSET, NF_INSET, NF_INSET);
        [_deleteButton setImage:[UIImage imageNamed:@"ic_close_photo"] forState:UIControlStateNormal];
        [_deleteButton setHidden:YES];
    }
    
    return _deleteButton;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [UIImageView newAutoLayoutView];
        _lineImageView.backgroundColor = GRAY_POST_CORNER;
    }
    
    return _lineImageView;
}@end

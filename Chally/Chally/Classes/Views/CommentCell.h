//
//  CommentCell.h
//  Chally
//
//  Created by Vardan Abrahamyan on 4/5/15.
//
//

@interface CommentCell : UITableViewCell

@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, strong) UIButton *userImageButton;
@property (nonatomic, strong) UILabel *commentTextLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIButton *reportButton;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) NSLayoutConstraint *widthReportButtonConstraint;
@property (nonatomic, assign) BOOL updateConstraint;
@property (nonatomic, assign) BOOL isReport;

@end

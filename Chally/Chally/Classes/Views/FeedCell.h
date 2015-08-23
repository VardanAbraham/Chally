//
//  FeedCell.h
//  Chally
//
//  Created by Vardan Abrahamyan on 3/4/15.
//
//

@interface FeedCell : UITableViewCell

@property (nonatomic, strong) UIView *customContentView;
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UIImageView *challangeImageView;
@property (nonatomic, strong) UIImageView *challangeStikerImageView;
@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIButton *commentButton;
@property (nonatomic, strong) UILabel *challangeDescriptionLabel;
@property (nonatomic, strong) UIButton *locationButton;
@property (nonatomic, strong) UIButton *raitingButton;
@property (nonatomic, strong) UIButton *responsesButton;
@property (nonatomic, strong) UIButton *commentsButton;
@property (nonatomic, strong) UIButton *respondButton;

@end

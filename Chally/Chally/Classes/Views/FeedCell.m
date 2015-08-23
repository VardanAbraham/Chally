//
//  FeedCell.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/4/15.
//
//

#import "FeedCell.h"


@interface FeedCell ()

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation FeedCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        [self addUIObjects];
    }
    [self.contentView setNeedsUpdateConstraints];

    return self;
}

- (void)addUIObjects
{
    _customContentView = [UIView newAutoLayoutView];
    [_customContentView setBackgroundColor:[UIColor whiteColor]];
    
    _avatarButton = [UIButton newAutoLayoutView];
    _avatarButton.layer.masksToBounds = YES;
    _avatarButton.layer.cornerRadius = 23;
    [_avatarButton setBackgroundColor:[UIColor redColor]];
    [_avatarButton setContentMode:UIViewContentModeScaleAspectFill];
    [_avatarButton setClipsToBounds:YES];

    _challangeImageView = [UIImageView newAutoLayoutView];
    [_challangeImageView setBackgroundColor:[UIColor blackColor]];
    [_challangeImageView setContentMode:UIViewContentModeScaleAspectFill];
    [_challangeImageView setClipsToBounds:YES];
    
    _locationButton = [UIButton newAutoLayoutView];
    [_locationButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
    [_locationButton setBackgroundColor:[UIColor clearColor]];
    
    _challangeDescriptionLabel = [UILabel newAutoLayoutView];
    [_challangeDescriptionLabel setBackgroundColor:[UIColor clearColor]];
    [_challangeDescriptionLabel setNumberOfLines:0];
    [_challangeDescriptionLabel setTextAlignment:NSTextAlignmentCenter];
    [_challangeDescriptionLabel setFont:[UIFont systemFontOfSize:14.0]];
    
    _lineImageView = [UIImageView newAutoLayoutView];
    [_lineImageView setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    _respondButton = [UIButton newAutoLayoutView];
    [_respondButton.layer setBorderWidth:2.0];
    [_respondButton.layer setBorderColor:LIGHTBLUE.CGColor];
    [_respondButton.layer setMasksToBounds:YES];
    [_respondButton.layer setCornerRadius:4.0];
    [_respondButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
    [_respondButton setTitle:@"Respond" forState:UIControlStateNormal];
    [_respondButton.titleLabel setFont:[UIFont systemFontOfSize:14.0]];
    
    _raitingButton = [UIButton newAutoLayoutView];
    [_raitingButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
    [_raitingButton setBackgroundColor:[UIColor clearColor]];
    [_raitingButton.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:11.0]];
    [_raitingButton setImage:[UIImage imageNamed:@"rate.png"] forState:UIControlStateNormal];

    _responsesButton = [UIButton newAutoLayoutView];
    [_responsesButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
    [_responsesButton setBackgroundColor:[UIColor clearColor]];
    [_responsesButton.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:11.0]];
    [_responsesButton setImage:[UIImage imageNamed:@"share.png"] forState:UIControlStateNormal];

    _commentsButton = [UIButton newAutoLayoutView];
    [_commentsButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
    [_commentsButton setBackgroundColor:[UIColor clearColor]];
    [_commentsButton.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:11.0]];
    [_commentsButton setImage:[UIImage imageNamed:@"comment.png"] forState:UIControlStateNormal];

    [self.contentView addSubview:self.customContentView];
    [self.customContentView addSubview:self.avatarButton];
    [self.customContentView addSubview:self.challangeImageView];
    [self.customContentView addSubview:self.challangeStikerImageView];
    [self.customContentView addSubview:self.locationButton];
    [self.customContentView addSubview:self.likeButton];
    [self.customContentView addSubview:self.shareButton];
    [self.customContentView addSubview:self.challangeDescriptionLabel];
    [self.customContentView addSubview:self.lineImageView];
    [self.customContentView addSubview:self.raitingButton];
    [self.customContentView addSubview:self.responsesButton];
    [self.customContentView addSubview:self.commentsButton];
    [self.customContentView addSubview:self.respondButton];
}

- (void)updateConstraints
{
    [self.customContentView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.customContentView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.customContentView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.customContentView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10.0];

    [self.avatarButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.avatarButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [self.avatarButton autoSetDimensionsToSize:CGSizeMake(46.0, 46.0)];
    
    [self.challangeImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.avatarButton withOffset:15];
    [self.challangeImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.challangeImageView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.challangeImageView autoSetDimensionsToSize:CGSizeMake(self.contentView.frame.size.width, self.contentView.frame.size.width - 120)];
    
    [self.locationButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.challangeImageView withOffset:5.0];
    [self.locationButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [self.locationButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [self.locationButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.challangeDescriptionLabel];
    
    [self.challangeDescriptionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.locationButton];
    [self.challangeDescriptionLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15.0];
    [self.challangeDescriptionLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15.0];
    [self.challangeDescriptionLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.lineImageView ];

    [self.lineImageView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.lineImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.lineImageView autoSetDimensionsToSize:CGSizeMake(self.contentView.frame.size.width - 20, 1)];
    
    [self.respondButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5.0];
    [self.respondButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10.0];
    [self.respondButton autoSetDimensionsToSize:CGSizeMake(100.0, 30.0)];
    
    [self.responsesButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:7.0];
    [self.responsesButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10.0];
    [self.responsesButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.commentsButton withOffset:15.0];
    [self.responsesButton autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    [self.responsesButton setImageEdgeInsets:UIEdgeInsetsMake(3, 3, 3, 3)];

    
    [self.commentsButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:7.0];
    [self.commentsButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.raitingButton withOffset:15.0];
    [self.commentsButton autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    [self.commentsButton setImageEdgeInsets:UIEdgeInsetsMake(3, 3, 3, 3)];

    [self.raitingButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:7.0];
    [self.raitingButton autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    [self.raitingButton setImageEdgeInsets:UIEdgeInsetsMake(3, 3, 3, 3)];

    [super updateConstraints];
}

- (void)prepareForReuse
{
    self.challangeImageView.image = nil;
}

- (void)awakeFromNib
{
    
}

@end

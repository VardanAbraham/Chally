//
//  RateView.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/22/15.
//
//

#import "RateViewController.h"
#import "CustomSlider.h"

@interface RateViewController()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *lineImageView1;
@property (nonatomic, strong) UIImageView *lineImageView2;

@end

@implementation RateViewController

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.frame];
        [backgroundView setBackgroundColor:[UIColor blackColor]];
        [backgroundView setAlpha:0.7];
        [self.view addSubview:backgroundView];
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeDialog)];
        [backgroundView addGestureRecognizer:tapRecognizer];
        
        [self addUIObjects];
        [self setConstraintsWithFram:frame];
    }
    
    return self;
}

- (void)addUIObjects
{
    _contentView = [UIView newAutoLayoutView];
    [_contentView setBackgroundColor:[UIColor whiteColor]];
    [_contentView.layer setCornerRadius:10.0];
    [_contentView.layer setMasksToBounds:YES];
    [self.view addSubview:_contentView];
    
    _headerView = [UIView newAutoLayoutView];
    [_headerView setBackgroundColor:LIGHTBLUE];

    _rateLabel = [UILabel newAutoLayoutView];
    [_rateLabel setTextColor:[UIColor whiteColor]];
    [_rateLabel setTextAlignment:NSTextAlignmentCenter];
    [_rateLabel setFont:[UIFont boldSystemFontOfSize:20.0]];
    [_rateLabel setText:@"0.0"];
    
    _smileImageView = [UIImageView newAutoLayoutView];
    [_smileImageView setImage:[UIImage imageNamed:@"Emoticon1.png"]];
    [self.contentView addSubview:self.smileImageView];
        
    self.lineImageView1 = [UIImageView newAutoLayoutView];
    [self.lineImageView1 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    [self.contentView addSubview:self.lineImageView1];

    self.lineImageView2 = [UIImageView newAutoLayoutView];
    [self.lineImageView2 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    [self.contentView addSubview:self.lineImageView2];

    self.cancelButton = [UIButton newAutoLayoutView];
    [self.cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.doneButton = [UIButton newAutoLayoutView];
    [self.doneButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];

    self.rateSlider = [CustomSlider newAutoLayoutView];
    [self.rateSlider setMinimumTrackTintColor:LIGHTBLUE];
    [self.rateSlider setMinimumValue:0.0];
    [self.rateSlider setMaximumValue:10.0];
    
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [self.cancelButton addTarget:self action:@selector(closeDialog) forControlEvents:UIControlEventTouchUpInside];
    
    [self.doneButton setTitle:@"Rate!" forState:UIControlStateNormal];
    [self.doneButton.titleLabel setFont:[UIFont systemFontOfSize:15.0]];

    [self.contentView addSubview:self.headerView];
    [self.headerView addSubview:_rateLabel];
    [self.headerView addSubview:_globalRateLabel];
    [self.contentView addSubview:_rateSlider];
    [self.contentView addSubview:_doneButton];
    [self.contentView addSubview:_cancelButton];
}

- (void)setConstraintsWithFram:(CGRect)frame
{
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(frame.size.height - 220)/2];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15.0];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15.0];
    [_contentView autoSetDimensionsToSize:CGSizeMake(frame.size.width - 30, 220)];
    
    [_headerView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [_headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_headerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_headerView autoSetDimensionsToSize:CGSizeMake(frame.size.width - 30, 50)];
    
    [_rateLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.0];
    [_rateLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_rateLabel autoSetDimensionsToSize:CGSizeMake(frame.size.width - 150, 30)];
    
    [_lineImageView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView withOffset:60];
    [_lineImageView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_lineImageView1 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_lineImageView1 autoSetDimensionsToSize:CGSizeMake(frame.size.width - 30, 1)];
    
    [_smileImageView autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    [_smileImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_smileImageView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.lineImageView1 withOffset:-17.0];
    
    [_rateSlider autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView1 withOffset:25];
    [_rateSlider autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20.0];
    [_rateSlider autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20.0];
    
    [_lineImageView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView1 withOffset:60];
    [_lineImageView2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_lineImageView2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_lineImageView2 autoSetDimensionsToSize:CGSizeMake(frame.size.width - 30, 1)];

    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5.0];
    [_cancelButton autoSetDimensionsToSize:CGSizeMake(70.0, 40)];
    
    [_doneButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_doneButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5.0];
    [_doneButton autoSetDimensionsToSize:CGSizeMake(70.0, 40)];
}

- (void)closeDialog
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

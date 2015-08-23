//
//  RespondView.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/22/15.
//
//

#import "RespondViewController.h"

@interface RespondViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *lineImageView1;
@property (nonatomic, strong) UIImageView *lineImageView2;

@end

@implementation RespondViewController

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
    
    self.firstButton = [UIButton newAutoLayoutView];
    [self.firstButton setTitle:@"Accept Challange" forState:UIControlStateNormal];
    [self.firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.secondButton = [UIButton newAutoLayoutView];
    [self.secondButton setTitle:@"Rechallange" forState:UIControlStateNormal];
    [self.secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];

    self.cancelButton = [UIButton newAutoLayoutView];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(closeDialog) forControlEvents:UIControlEventTouchUpInside];

    self.lineImageView1 = [UIImageView newAutoLayoutView];
    [self.lineImageView1 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    self.lineImageView2 = [UIImageView newAutoLayoutView];
    [self.lineImageView2 setImage:[UIImage imageNamed:@"line_horizontal.png"]];

    [self.view addSubview:_contentView];
    [self.contentView addSubview:self.firstButton];
    [self.contentView addSubview:self.lineImageView1];
    [self.contentView addSubview:self.secondButton];
    [self.contentView addSubview:self.lineImageView2];
    [self.contentView addSubview:self.cancelButton];
}

- (void)setConstraintsWithFram:(CGRect)frame
{
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(frame.size.height - 153)/2];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40.0];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40.0];
    [_contentView autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 153)];
    
    [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.0];
    [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.firstButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.firstButton autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 50)];
    
    [_lineImageView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.firstButton];
    [_lineImageView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_lineImageView1 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_lineImageView1 autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 1)];
    
    [_secondButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView1];
    [_secondButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_secondButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_secondButton autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 50)];
    
    [_lineImageView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.secondButton];
    [_lineImageView2 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_lineImageView2 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_lineImageView2 autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 1)];
    
    [_cancelButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView2];
    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_cancelButton autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 50)];
}

- (void)closeDialog
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end

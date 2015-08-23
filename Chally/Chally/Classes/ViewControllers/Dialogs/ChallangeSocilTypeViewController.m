//
//  ChallangeSocilTypeViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 7/13/15.
//
//

#import "ChallangeSocilTypeViewController.h"

@interface ChallangeSocilTypeViewController ()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *lineImageView1;

@end

@implementation ChallangeSocilTypeViewController

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
    [self.firstButton setTitle:@"Public" forState:UIControlStateNormal];
    [self.firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.firstButton addTarget:self action:@selector(closeDialog:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstButton setTag:0];
    
    self.secondButton = [UIButton newAutoLayoutView];
    [self.secondButton setTitle:@"Private" forState:UIControlStateNormal];
    [self.secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.secondButton addTarget:self action:@selector(closeDialog:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondButton setTag:1];

    self.lineImageView1 = [UIImageView newAutoLayoutView];
    [self.lineImageView1 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    [self.view addSubview:_contentView];
    [self.contentView addSubview:self.firstButton];
    [self.contentView addSubview:self.lineImageView1];
    [self.contentView addSubview:self.secondButton];
}

- (void)setConstraintsWithFram:(CGRect)frame
{
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(frame.size.height - 102)/2];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40.0];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40.0];
    [_contentView autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 102)];
    
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
}

- (void)closeDialog:(UIButton*)sender
{
    [self.delegate clickButtonAtTag:sender.tag];
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)closeDialog
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

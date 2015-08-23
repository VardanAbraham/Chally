//
//  ShareView.m
//  Chally
//
//  Created by Vardan Abrahamyan on 5/21/15.
//
//

#import "ShareViewController.h"
#import <Twitter/Twitter.h>

@interface ShareViewController ()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIImageView *lineImageView1;
@property (nonatomic, strong) UIImageView *lineImageView2;
@property (nonatomic, strong) UIImageView *lineImageView3;
@end

@implementation ShareViewController

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
    [self.firstButton setTitle:@"Share on Facebook" forState:UIControlStateNormal];
    [self.firstButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.firstButton addTarget:self action:@selector(shareOnFaceook:) forControlEvents:UIControlEventTouchUpInside];
    
    self.secondButton = [UIButton newAutoLayoutView];
    [self.secondButton setTitle:@"Share on Twitter" forState:UIControlStateNormal];
    [self.secondButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.secondButton addTarget:self action:@selector(shareOnTwitter:) forControlEvents:UIControlEventTouchUpInside];

    self.thirdButton = [UIButton newAutoLayoutView];
    [self.thirdButton setTitle:@"Other" forState:UIControlStateNormal];
    [self.thirdButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    self.cancelButton = [UIButton newAutoLayoutView];
    [self.cancelButton setTitle:@"Cancel" forState:UIControlStateNormal];
    [self.cancelButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.cancelButton addTarget:self action:@selector(closeDialog) forControlEvents:UIControlEventTouchUpInside];

    self.lineImageView1 = [UIImageView newAutoLayoutView];
    [self.lineImageView1 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    self.lineImageView2 = [UIImageView newAutoLayoutView];
    [self.lineImageView2 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    self.lineImageView3 = [UIImageView newAutoLayoutView];
    [self.lineImageView3 setImage:[UIImage imageNamed:@"line_horizontal.png"]];
    
    [self.view addSubview:_contentView];
    [self.contentView addSubview:self.firstButton];
    [self.contentView addSubview:self.lineImageView1];
    [self.contentView addSubview:self.secondButton];
    [self.contentView addSubview:self.lineImageView2];
    [self.contentView addSubview:self.thirdButton];
    [self.contentView addSubview:self.lineImageView3];
    [self.contentView addSubview:self.cancelButton];
}

- (void)setConstraintsWithFram:(CGRect)frame
{
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(frame.size.height - 204)/2];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:40.0];
    [_contentView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:40.0];
    [_contentView autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 204)];
    
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
    
    [_thirdButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView2];
    [_thirdButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_thirdButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_thirdButton autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 50)];
    
    [_lineImageView3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.thirdButton];
    [_lineImageView3 autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_lineImageView3 autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_lineImageView3 autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 1)];
    
    [_cancelButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.lineImageView3];
    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [_cancelButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [_cancelButton autoSetDimensionsToSize:CGSizeMake(frame.size.width - 80, 50)];
}

#pragma mark - Share Functions

- (void)shareOnTwitter:(UIButton *)button
{
    [UIHelper showLoading];
    SLComposeViewController *tweetSheet = [SLComposeViewController
                                           composeViewControllerForServiceType:
                                           SLServiceTypeTwitter];
    
    
    tweetSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
            case SLComposeViewControllerResultCancelled:
                
                break;
            case SLComposeViewControllerResultDone:
                
                break;
        }
    };
    
    [self presentViewController:tweetSheet animated:NO completion:^{
        [UIHelper dismissLoading];
    }];
}

- (void)shareOnFaceook:(UIButton *)button
{
    [UIHelper showLoading];
    SLComposeViewController *fbSheet = [SLComposeViewController
                                        composeViewControllerForServiceType:
                                        SLServiceTypeFacebook];
    
    fbSheet.completionHandler = ^(SLComposeViewControllerResult result) {
        switch(result) {
            case SLComposeViewControllerResultCancelled:
                
                break;
                
            case SLComposeViewControllerResultDone:
                
                break;
        }
    };
    
    [self presentViewController:fbSheet animated:NO completion:^{
        [UIHelper dismissLoading];
    }];
}

- (void)closeDialog
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end

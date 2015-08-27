//
//  ViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

#import <GooglePlus/GooglePlus.h>
#import "RegisterViewController.h"
#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "CounditionViewController.h"
#import "TabBarController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#define Social_Buttons_Position (IS_IPHONE_4 ? 180.f : 236.f)

@interface RegisterViewController () <GPPSignInDelegate>

@property (nonatomic, strong) UIImageView *challyLogoImageView;
@property (nonatomic, strong) UIImageView *alphaImageView;
@property (nonatomic, strong) UIButton *facebookBtn;
@property (nonatomic, strong) UIButton *googleBtn;
@property (nonatomic, strong) UIButton *signInBtn;
@property (nonatomic, strong) UIButton *signUpBtn;
@property (nonatomic, strong) UIButton *privicyBtn;
@property (nonatomic, strong) UIButton *termsBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addAllUIObjects];
    [self setConstraints];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)addAllUIObjects
{
    UIImageView *backgroundImageView = [UIImageView newAutoLayoutView];
    [self.view addSubview:backgroundImageView];
    [backgroundImageView setImage:[UIImage imageNamed:@"Register_background.png"]];
    [backgroundImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0,0, 0, 0)];

    [self.view addSubview:self.challyLogoImageView];
    [self.view addSubview:self.alphaImageView];
    [self.view addSubview:self.facebookBtn];
    [self.view addSubview:self.googleBtn];
    
    [self.view addSubview:self.signInBtn];
    [self.view addSubview:self.signUpBtn];
    [self.view addSubview:self.privicyBtn];
    [self.view addSubview:self.termsBtn];
}

#pragma mark - Actions

- (void)openSignUpPage:(UIButton *)sender
{
    SignUpViewController *signUpVC = [SignUpViewController new];
    [self.navigationController pushViewController:signUpVC animated:YES];
}

- (void)openSignInPage:(UIButton *)sender
{
    SignInViewController *signInVC = [SignInViewController new];
    [self.navigationController pushViewController:signInVC animated:YES];
}

- (void)openCounditionsPage:(UIButton *)button
{
    CounditionViewController *counditionVC = [CounditionViewController new];
    [counditionVC setIsPageTypePrivice:[[NSNumber numberWithInteger:button.tag] boolValue]];
    [self.navigationController pushViewController:counditionVC animated:YES];
}

- (void)signInWithFacebook:(UIButton *)sender
{
    [[FBSDKLoginManager new] logInWithReadPermissions:@[] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {

        } else if (result.isCancelled) {

        } else {
            if ([result.grantedPermissions containsObject:@"email"]) {
                [self openTabbarController];
            }
        }
    }];
}

- (void)signInWithGoogle:(UIButton *)sender
{
    if ([Utils isNetworkConnected]) {
        GPPSignIn *signIn = [GPPSignIn sharedInstance];
        signIn.shouldFetchGooglePlusUser = YES;
        signIn.shouldFetchGoogleUserEmail = YES;       
        signIn.clientID = GooglePlusClientId;
        signIn.scopes = @[ @"profile" ];
        signIn.delegate = self;
        [signIn authenticate];
    } else {
        [UIHelper showAlertWithMessage:@"No Internet!"];
    }
}

#pragma mark - Custom methods

- (void)openTabbarController
{
    [self presentViewController:[UIHelper getTabBar] animated:YES completion:nil];
}

#pragma mark - GPPSignInDelegate method

- (void)finishedWithAuth:(GTMOAuth2Authentication *)auth
                   error: (NSError *) error {
    if (!error) {
        [self openTabbarController];
    }
}

#pragma mark - Update Constraints

- (void)setConstraints
{
    [self.challyLogoImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:RC_LOGO_INSET];
    [self.challyLogoImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.challyLogoImageView autoSetDimensionsToSize:RC_LOGO_SIZE];
    
    [self.alphaImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:self.view.frame.size.height*0.3];
    [self.alphaImageView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.alphaImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.alphaImageView autoPinEdgeToSuperviewEdge:ALEdgeRight];

    [self.facebookBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:Social_Buttons_Position];
    [self.facebookBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.facebookBtn autoSetDimensionsToSize:CGSizeMake(RC_BUTTON_WIDTH , RC_BUTTON_HEIGHT)];
    
    [self.googleBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.facebookBtn withOffset:RC_OFFSET];
    [self.googleBtn autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.googleBtn autoSetDimensionsToSize:CGSizeMake(RC_BUTTON_WIDTH , RC_BUTTON_HEIGHT)];
    
    UILabel *bottomBtnConnetnViewLabel = [UILabel newAutoLayoutView];
    [self.view addSubview:bottomBtnConnetnViewLabel];

    [bottomBtnConnetnViewLabel setBackgroundColor:[UIColor clearColor]];
    [bottomBtnConnetnViewLabel setTextColor:[UIColor whiteColor]];
    [bottomBtnConnetnViewLabel setText:@"or"];
    [bottomBtnConnetnViewLabel setFont:OPENSANS_LIGHT];

    [bottomBtnConnetnViewLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [bottomBtnConnetnViewLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.googleBtn withOffset:RC_OFFSET];
    
    [self.signInBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:bottomBtnConnetnViewLabel withOffset:-5.0];
    [self.signUpBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:bottomBtnConnetnViewLabel withOffset:5.0];
    [self.signInBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:bottomBtnConnetnViewLabel];
    [self.signUpBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:bottomBtnConnetnViewLabel];
    
    UIView *verticalLineView = [UIView newAutoLayoutView];
    [self.view addSubview:verticalLineView];
    [verticalLineView setBackgroundColor:[UIColor whiteColor]];
    [verticalLineView autoSetDimensionsToSize:CGSizeMake(1.0, 16)];
    [verticalLineView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:RC_OFFSET];
    [verticalLineView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [self.termsBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:verticalLineView withOffset:-5.0];
    [self.termsBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:verticalLineView];
    
    [self.privicyBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:verticalLineView withOffset:5.0];
    [self.privicyBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:verticalLineView];
}

#pragma mark - Initializations

- (UIImageView *)challyLogoImageView
{
    if (!_challyLogoImageView) {
        _challyLogoImageView = [UIImageView newAutoLayoutView];
        [_challyLogoImageView setImage:[UIImage imageNamed:@"Chally-Logo.png"]];
    }
    return _challyLogoImageView;
}

- (UIButton *)facebookBtn
{
    if (!_facebookBtn) {
        _facebookBtn = [UIButton newAutoLayoutView];
        [_facebookBtn.layer setBorderWidth:2.0];
        [_facebookBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_facebookBtn.layer setMasksToBounds:YES];
        [_facebookBtn.layer setCornerRadius:5.0];
        [_facebookBtn setTitle:@"Connect with FACEBOOK" forState:UIControlStateNormal];
        [_facebookBtn.titleLabel setFont:OPENSANS_LIGHT];
        [_facebookBtn setBackgroundImage:[UIImage imageNamed:@"SocialButtonsBackground.png"] forState:UIControlStateNormal];
        [_facebookBtn addTarget:self action:@selector(signInWithFacebook:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _facebookBtn;
}

- (UIButton *)googleBtn
{
    if (!_googleBtn) {
        _googleBtn = [UIButton newAutoLayoutView];
        [_googleBtn.layer setBorderWidth:2.0];
        [_googleBtn.layer setBorderColor:[UIColor whiteColor].CGColor];
        [_googleBtn.layer setMasksToBounds:YES];
        [_googleBtn.layer setCornerRadius:5.0];
        [_googleBtn setTitle:@"Connect with GOOGLE" forState:UIControlStateNormal];
        [_googleBtn.titleLabel setFont:OPENSANS_LIGHT];
        [_googleBtn setBackgroundImage:[UIImage imageNamed:@"SocialButtonsBackground.png"] forState:UIControlStateNormal];
        [_googleBtn addTarget:self action:@selector(signInWithGoogle:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _googleBtn;
}

- (UIButton *)signInBtn
{
    if (!_signInBtn) {
        _signInBtn = [UIButton newAutoLayoutView];
        [_signInBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
        [_signInBtn.titleLabel setFont:OPENSANS_SEMIBOLD];
        [_signInBtn addTarget:self action:@selector(openSignInPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signInBtn;
}

- (UIButton *)signUpBtn
{
    if (!_signUpBtn) {
        _signUpBtn = [UIButton newAutoLayoutView];
        [_signUpBtn setTitle:@"SIGN UP" forState:UIControlStateNormal];
        [_signUpBtn.titleLabel setFont:OPENSANS_SEMIBOLD];

        [_signUpBtn addTarget:self action:@selector(openSignUpPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _signUpBtn;
}

- (UIImageView *)alphaImageView
{
    if (!_alphaImageView) {
        _alphaImageView = [UIImageView newAutoLayoutView];
        [_alphaImageView setImage:[UIImage imageNamed:@"Chally-Register_0003_Bakcground.png"]];
    }
    
    return _alphaImageView;
}

- (UIButton *)termsBtn
{
    if (!_termsBtn) {
        _termsBtn = [UIButton newAutoLayoutView];
        [_termsBtn setTag:0];
        [_termsBtn addTarget:self action:@selector(openCounditionsPage:) forControlEvents:UIControlEventTouchUpInside];
        [_termsBtn setTitle:@"Terms and Conditions" forState:UIControlStateNormal];
        [_termsBtn.titleLabel setFont:OPENSANS_SEMIBOLD];
    }
    return _termsBtn;
}

- (UIButton *)privicyBtn
{
    if (!_privicyBtn) {
        _privicyBtn = [UIButton newAutoLayoutView];
        [_privicyBtn setTag:1];
        [_privicyBtn addTarget:self action:@selector(openCounditionsPage:) forControlEvents:UIControlEventTouchUpInside];
        [_privicyBtn setTitle:@"Privicy Policy" forState:UIControlStateNormal];
        [_privicyBtn.titleLabel setFont:OPENSANS_SEMIBOLD];
    }
    return _privicyBtn;
}

@end

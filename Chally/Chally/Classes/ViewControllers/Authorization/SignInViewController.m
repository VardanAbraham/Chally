//
//  SignInViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

#import "SignInViewController.h"
#import "SignUpViewController.h"
#import "TabBarController.h"

@interface SignInViewController () <UITextFieldDelegate>

@property (strong, nonatomic) UIView *textFieldsContainerView;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UITextField *emailTextField;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *nextBtn;
@property (strong, nonatomic) UIButton *signUpButton;

@end

@implementation SignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addNextButton];
    [self addUIElements];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    [self.navigationController.navigationBar.topItem setTitle:@"Sign In"];
}

#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.emailTextField]) {
        [self.passwordTextField becomeFirstResponder];
        return NO;
    }
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.emailTextField.text.length > 0 && self.passwordTextField.text.length > 6) {
        [self.nextBtn setEnabled:YES];
        [self.nextBtn.titleLabel setAlpha:1];
    }
    return YES;
}

#pragma mark - Custom methods

- (void)addUIElements
{
    [self.view addSubview:self.textFieldsContainerView];
    [self.textFieldsContainerView addSubview:self.emailTextField];
    [self.textFieldsContainerView addSubview:self.passwordTextField];
    [self.view addSubview:self.infoLabel];
    [self.view addSubview:self.signUpButton];
    
    [self setConstraints];
}

- (void)addNextButton
{
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.nextBtn setTitle:@"Next" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(signInUser:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextBtn setFrame:CGRectMake(0, 0, 100, 44)];
    [self.nextBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.nextBtn];
    
    [self.navigationItem setRightBarButtonItem:barButtonItem animated:YES];
    [self.nextBtn setEnabled:NO];
    [self.nextBtn.titleLabel setAlpha:0.3];
}

- (void)setConstraints
{
    [self.textFieldsContainerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:TOP_BARS_HEIGHT];
    [self.textFieldsContainerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.textFieldsContainerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.textFieldsContainerView autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT * 2 + 3];
    
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset: 1];
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.emailTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.passwordTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.emailTextField withOffset:1.0];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.passwordTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.infoLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.textFieldsContainerView withOffset:SIOFFSET];
    [self.infoLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:SIINSET];
    
    [self.signUpButton autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.infoLabel];
    [self.signUpButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.infoLabel withOffset:SIOFFSET];
}

#pragma mark - Actions

- (void)signInUser:(id)sender
{
    [self presentViewController:[UIHelper getTabBar] animated:YES completion:nil];
}

- (void)openSignUpPage:(UIButton *)sender
{
    SignUpViewController *signUpVC= [SignUpViewController new];
    [self.navigationController pushViewController:signUpVC animated:YES];
}

- (void)popCurrentVIewController:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Intilazation

- (UIView *)textFieldsContainerView
{
    if (!_textFieldsContainerView) {
        _textFieldsContainerView = [UIView newAutoLayoutView];
        [_textFieldsContainerView setBackgroundColor:GRAY];
    }
    
    return _textFieldsContainerView;
}

- (UITextField *)emailTextField
{
    if (!_emailTextField) {
        _emailTextField = [UITextField newAutoLayoutView];
        [_emailTextField setFont:SITEXTFONT];
        [_emailTextField setPlaceholder:@"Email"];
        [_emailTextField setBackgroundColor:[UIColor whiteColor]];
        [_emailTextField setTextAlignment:NSTextAlignmentCenter];
        [_emailTextField setDelegate:self];
    }
    
    return _emailTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [UITextField newAutoLayoutView];
        [_passwordTextField setFont:SITEXTFONT];
        [_passwordTextField setPlaceholder:@"Password"];
        [_passwordTextField setBackgroundColor:[UIColor whiteColor]];
        [_passwordTextField setSecureTextEntry:YES];
        [_passwordTextField setTextAlignment:NSTextAlignmentCenter];
        [_passwordTextField setDelegate:self];
    }
    
    return _passwordTextField;
}

- (UILabel *)infoLabel
{
    if (!_infoLabel) {
        _infoLabel = [UILabel newAutoLayoutView];
        [_infoLabel setText:@"Don't have an account?"];
        [_infoLabel setFont:SITEXTFONT];
    }
    return _infoLabel;
}

- (UIButton *)signUpButton
{
    if (!_signUpButton) {
        _signUpButton = [UIButton newAutoLayoutView];
        [_signUpButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
        [_signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
        [_signUpButton.titleLabel setFont:SITEXTFONT];
        [_signUpButton addTarget:self action:@selector(openSignUpPage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _signUpButton;
}

@end

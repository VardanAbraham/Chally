//
//  SignUpViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

#import <QuartzCore/QuartzCore.h>
#import "SignUpViewController.h"

#define FONT_SIZE (IS_IPAD ? 15.f : 12.f)

@interface SignUpViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITextField *emailTextField;
@property (nonatomic, strong) UITextField *userNameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *cityTextField;
@property (nonatomic, strong) UILabel *midleLabel;
@property (strong, nonatomic) UIButton *nextBtn;
@property (nonatomic, strong) NSLayoutConstraint *scrollHeightConstraint;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addUIobjects];
    [self setConstraints];
    [self addNextButton];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameWillChange:)
                                                 name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self.navigationLeftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [self.navigationController.navigationBar.topItem setTitle:@"Sign Up"];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width, SIFIELD_HEIGHT * 6 + 7)];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];

    [super viewWillDisappear:animated];
}


#pragma mark - TextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.emailTextField]) {
        [self.userNameTextField becomeFirstResponder];
        return NO;
    } else if ([textField isEqual:self.userNameTextField]){
        [self.passwordTextField becomeFirstResponder];
        return NO;
    } else if ([textField isEqual:self.passwordTextField]) {
        [self.nameTextField becomeFirstResponder];
        return NO;
    } else if ([textField isEqual:self.nameTextField]){
        [self.cityTextField becomeFirstResponder];
        return NO;
    }
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    [self needEnableNextButton];
    
    return YES;
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


#pragma mark - Custom methods

- (void)addUIobjects
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.emailTextField];
    [self.scrollView addSubview:self.userNameTextField];
    [self.scrollView addSubview:self.passwordTextField];
    [self.scrollView addSubview:self.midleLabel];
    [self.scrollView addSubview:self.nameTextField];
    [self.scrollView addSubview:self.cityTextField];
}

- (void)setConstraints
{
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.scrollView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    self.scrollHeightConstraint = [self.scrollView autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT * 7 + 21];
    
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.0];
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.emailTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.emailTextField autoSetDimensionsToSize:CGSizeMake(self.view.frame.size.width, SIFIELD_HEIGHT)];
    
    [self.userNameTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.emailTextField withOffset:1.0];
    [self.userNameTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.userNameTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.userNameTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.passwordTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.userNameTextField withOffset:1.0];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.passwordTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.midleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.passwordTextField withOffset:1.0];
    [self.midleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.midleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.midleLabel autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.nameTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.midleLabel withOffset:1.0];
    [self.nameTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.nameTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.nameTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
    
    [self.cityTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameTextField withOffset:1.0];
    [self.cityTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.cityTextField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.cityTextField autoSetDimension:ALDimensionHeight toSize:SIFIELD_HEIGHT];
}

- (void)setFonts
{
    float navigationBarFontSize;
    float textFieldFontSize;
    if (IS_IPHONE_6_PLUS) {
        navigationBarFontSize = 27;
        textFieldFontSize = 46;
    } else if (IS_IPHONE_6) {
        navigationBarFontSize = 16.5;
        textFieldFontSize = 28;
    }else if (IS_IPHONE_5) {
        navigationBarFontSize = 14;
        textFieldFontSize = 18;
    } else if (IS_IPHONE_4) {
        navigationBarFontSize = 14;
        textFieldFontSize = 18;
    }
    [self.navigationLeftButton.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:navigationBarFontSize]];
    [self.navigationBarRightButton.titleLabel setFont:[UIFont fontWithName:@"OpenSans" size:navigationBarFontSize]];
    [self.emailTextField setFont:[UIFont fontWithName:@"OpenSans" size:FONT_SIZE]];
    [self.userNameTextField setFont:[UIFont fontWithName:@"OpenSans" size:FONT_SIZE]];
    [self.passwordTextField setFont:[UIFont fontWithName:@"OpenSans" size:FONT_SIZE]];
    [self.nameTextField setFont:[UIFont fontWithName:@"OpenSans" size:FONT_SIZE]];
    [self.cityTextField setFont:[UIFont fontWithName:@"OpenSans" size:FONT_SIZE]];
    [self.midleLabel setFont:[UIFont fontWithName:@"OpenSans" size:textFieldFontSize]];
}

- (IBAction)sendUserInfo:(UIButton*)sender
{
    NSMutableDictionary * userinfo = [@{@"email" : self.emailTextField.text, @"username" : self.userNameTextField.text, @"password" : self.passwordTextField.text} copy];
    if (self.nameTextField.text.length > 0) {
        [userinfo setObject:self.nameTextField.text forKey:@"name"];
    }
    if (self.cityTextField.text.length > 0) {
        [userinfo setObject:self.cityTextField.text forKey:@"city"];
    }
}

- (void)needEnableNextButton
{
    if ([Utils isValidEmail:self.emailTextField.text] && self.userNameTextField.text.length > 4 && self.passwordTextField.text.length > 6) {
        [self.nextBtn setEnabled:YES];
        [self.nextBtn.titleLabel setAlpha:1.0];
    } else {
        [self.nextBtn setEnabled:NO];
        [self.nextBtn.titleLabel setAlpha:0.3];
    }
}

#pragma mark - Actions

- (void)popCurrentViewController:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)signInUser:(id)sender
{
    [self presentViewController:[UIHelper getTabBar] animated:YES completion:nil];
}

- (void)textFieldBecomeActive:(UITextField *)textField
{
    
}

#pragma mark - Initalization

- (UIScrollView*)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView newAutoLayoutView];
        [_scrollView setBackgroundColor:GRAY];
        [_scrollView setScrollEnabled:YES];
        [_scrollView setDelegate:self];
    }
    return _scrollView;
}

- (UITextField *)emailTextField
{
    if (!_emailTextField) {
        _emailTextField = [UITextField newAutoLayoutView];
        [_emailTextField setBackgroundColor:[UIColor whiteColor]];
        [_emailTextField setTextAlignment:NSTextAlignmentCenter];
        [_emailTextField setReturnKeyType:UIReturnKeyNext];
        [_emailTextField setPlaceholder:@"Email*"];
        [_emailTextField setDelegate:self];
        [_emailTextField setTag:0];
        [_emailTextField addTarget:self action:@selector(textFieldBecomeActive:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _emailTextField;
}

- (UITextField *)userNameTextField
{
    if (!_userNameTextField) {
        _userNameTextField = [UITextField newAutoLayoutView];
        [_userNameTextField setBackgroundColor:[UIColor whiteColor]];
        [_userNameTextField setTextAlignment:NSTextAlignmentCenter];
        [_userNameTextField setReturnKeyType:UIReturnKeyNext];
        [_userNameTextField setPlaceholder:@"Username*"];
        [_userNameTextField setDelegate:self];
        [_userNameTextField setTag:1];
        [_userNameTextField addTarget:self action:@selector(textFieldBecomeActive:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _userNameTextField;
}


- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [UITextField newAutoLayoutView];
        [_passwordTextField setBackgroundColor:[UIColor whiteColor]];
        [_passwordTextField setTextAlignment:NSTextAlignmentCenter];
        [_passwordTextField setReturnKeyType:UIReturnKeyNext];
        [_passwordTextField setSecureTextEntry:YES];
        [_passwordTextField setPlaceholder:@"Password*"];
        [_passwordTextField setDelegate:self];
        [_passwordTextField setTag:2];
        [_passwordTextField addTarget:self action:@selector(textFieldBecomeActive:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _passwordTextField;
}

- (UITextField *)nameTextField
{
    if (!_nameTextField) {
        _nameTextField = [UITextField newAutoLayoutView];
        [_nameTextField setBackgroundColor:[UIColor whiteColor]];
        [_nameTextField setPlaceholder:@"Name"];
        [_nameTextField setTextAlignment:NSTextAlignmentCenter];
        [_nameTextField setReturnKeyType:UIReturnKeyNext];
        [_nameTextField setDelegate:self];
        [_nameTextField setTag:3];
        [_nameTextField addTarget:self action:@selector(textFieldBecomeActive:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _nameTextField;
}

- (UITextField *)cityTextField
{
    if (!_cityTextField) {
        _cityTextField = [UITextField newAutoLayoutView];
        [_cityTextField setBackgroundColor:[UIColor whiteColor]];
        [_cityTextField setTextAlignment:NSTextAlignmentCenter];
        [_cityTextField setPlaceholder:@"City"];
        [_cityTextField setReturnKeyType:UIReturnKeyDone];
        [_cityTextField setDelegate:self];
        [_cityTextField setTag:4];
        [_cityTextField addTarget:self action:@selector(textFieldBecomeActive:) forControlEvents:UIControlEventEditingDidBegin];
    }
    return _cityTextField;
}

- (UILabel *)midleLabel
{
    if (!_midleLabel) {
        _midleLabel = [UILabel newAutoLayoutView];
        [_midleLabel setBackgroundColor:[UIColor whiteColor]];
        [_midleLabel setTextAlignment:NSTextAlignmentCenter];
        [_midleLabel setTextColor:[UIColor grayColor]];
        [_midleLabel setText:@"Personal"];
    }
    return _midleLabel;
}


#pragma mark - Keyboard notifications

-(void)keyboardFrameWillChange:(NSNotification *)notification
{
    CGRect keyboardFrame = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.scrollHeightConstraint.constant = self.view.frame.size.height - keyboardFrame.size.height;
}

- (void)keyboardDidHide:(NSNotification *)notification
{
    self.scrollHeightConstraint.constant = SIFIELD_HEIGHT * 7 + 21;
}
@end

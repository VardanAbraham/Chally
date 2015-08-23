//
//  CreateChallangeViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/1/15.
//
//

#import "CreateChallangeViewController.h"
#import "ChallangeSocilTypeViewController.h"
#import "TabBarController.h"
#import "MapViewController.h"

@interface CreateChallangeViewController () <UITextFieldDelegate, ChallangeSocialTypeDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView *avatraImageView;
@property (nonatomic, strong) UIButton *createButton;
@property (nonatomic, strong) UIButton *socialTypeButton;
@property (nonatomic, strong) UIButton *addLocationButton;
@property (nonatomic, strong) UIImageView *smileImageView;

@property (nonatomic, strong) UIView *mediaContentView;
@property (nonatomic, strong) UIView *headerMediaView;
@property (nonatomic, strong) UIButton *mediaSettingsButton;
@property (nonatomic, strong) UIButton *mediaAttachButton;
@property (nonatomic, strong) UIButton *mediaStrickerButton;
@property (nonatomic, strong) UIButton *mediaButton;

@property (nonatomic, strong) UIButton *cameraButton;
@property (nonatomic, strong) UIButton *libraryButton;

@end

#define avatarImageHeight (40.f)
#define headerViewHeight (50.f)

@implementation CreateChallangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addUIObjects];
    [self setConstraints];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self setNavigationBarLeftButton];
    [self.tabBarController setTitle:@"Create a Challenge"];
}

#pragma mark - Custom methods

- (void)setNavigationBarLeftButton
{
    UIView *leftView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, 50, 33)];
    [leftView setBackgroundColor:[UIColor clearColor]];
    UIButton *leftNavigationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftNavigationButton setFrame:CGRectMake(0, 0, 50, 33)];
    [leftNavigationButton addTarget:self action:@selector(showTabBar:) forControlEvents:UIControlEventTouchUpInside];
    [leftNavigationButton setImage:[UIImage imageNamed:@"backImage.png"] forState:UIControlStateNormal];
    [leftNavigationButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 5)];
    [leftNavigationButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [leftView addSubview:leftNavigationButton];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    [self.tabBarController.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
}

- (void)addUIObjects
{
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.avatraImageView];
    [self.headerView addSubview:self.createButton];
    [self.headerView addSubview:self.socialTypeButton];
    
    [self.view addSubview:self.smileImageView];
    [self.view addSubview:self.textField];
    
    [self.view addSubview:self.mediaContentView];
    [self.mediaContentView addSubview:self.headerMediaView];
    [self.headerMediaView addSubview:self.mediSettingsButton];
    [self.headerMediaView addSubview:self.mediaStrickerButton];
    [self.headerMediaView addSubview:self.mediaAttachButton];
    [self.headerMediaView addSubview:self.mediaButton];
    
    [self.mediaContentView addSubview:self.cameraButton];
    [self.mediaContentView addSubview:self.libraryButton];

    [self.view addSubview:self.addLocationButton];
}

- (void)setConstraints
{
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:65.0];
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.headerView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.headerView autoSetDimension:ALDimensionHeight toSize:headerViewHeight];
    
    [self.avatraImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(headerViewHeight - avatarImageHeight)/2];
    [self.avatraImageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(headerViewHeight - avatarImageHeight)/2];
    [self.avatraImageView autoSetDimensionsToSize:CGSizeMake(avatarImageHeight, avatarImageHeight)];
    
    [self.createButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:(headerViewHeight - 25.0)/2];
    [self.createButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(headerViewHeight - 25.0)/2];
    [self.createButton autoSetDimensionsToSize:CGSizeMake(25.0, 25.0)];
    
    [self.socialTypeButton autoPinEdgeToSuperviewMargin:ALEdgeBottom];
    [self.socialTypeButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.avatraImageView withOffset:10.0];
    [self.socialTypeButton autoSetDimensionsToSize:CGSizeMake(120.0, 20.0)];
    
    UIImageView *lineImageView = [UIImageView newAutoLayoutView];
    [self.view addSubview:lineImageView];
    [lineImageView setImage:[UIImage imageNamed:@"line.png"]];
    [lineImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView];
    [lineImageView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [lineImageView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [lineImageView autoSetDimensionsToSize:CGSizeMake(self.view.frame.size.width, 1.0)];
    
    [self.smileImageView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerView withOffset:20.0];
    [self.smileImageView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.smileImageView autoSetDimensionsToSize:CGSizeMake(20.0, 20.0)];
    
    [self.textField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.smileImageView withOffset:10.0];
    [self.textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15.0];
    [self.textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15.0];
    [self.textField autoSetDimension:ALDimensionHeight toSize:40.0];
    
    [self.mediaContentView autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.mediaContentView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.mediaContentView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.mediaContentView autoSetDimension:ALDimensionHeight toSize:self.view.frame.size.height/2.3];
    
    [self.headerMediaView autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.headerMediaView autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.headerMediaView autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.headerMediaView autoSetDimension:ALDimensionHeight toSize:40.0];
    
    [self.mediSettingsButton autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.mediSettingsButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.mediSettingsButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.mediSettingsButton autoSetDimension:ALDimensionWidth toSize:30];
    
    [self.mediaStrickerButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.mediaStrickerButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.mediaStrickerButton autoSetDimensionsToSize:CGSizeMake(30, 40)];
    
    [self.mediaAttachButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.mediaStrickerButton withOffset:25.0];
    [self.mediaAttachButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.mediaAttachButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.mediaAttachButton autoSetDimension:ALDimensionWidth toSize:30.0];
    
    [self.mediaButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.mediaStrickerButton withOffset:-25.0];
    [self.mediaButton autoPinEdgeToSuperviewEdge:ALEdgeTop];
    [self.mediaButton autoPinEdgeToSuperviewEdge:ALEdgeBottom];
    [self.mediaButton autoSetDimension:ALDimensionWidth toSize:30.0];
    
    [self.addLocationButton autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.mediaContentView withOffset:-8.0];
    [self.addLocationButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.addLocationButton autoSetDimension:ALDimensionWidth toSize:110];
    [self.addLocationButton autoSetDimension:ALDimensionHeight toSize:25.0];
    
    [self.cameraButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerMediaView withOffset:CC_IMAGE_INSETS];
    [self.cameraButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:CC_IMAGE_INSETS];
    [self.cameraButton autoSetDimensionsToSize:CGSizeMake(CC_IMAGE_SIZE, CC_IMAGE_SIZE)];
    
    [self.libraryButton autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.cameraButton withOffset:CC_IMAGE_INSETS];
    [self.libraryButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerMediaView withOffset:CC_IMAGE_INSETS];
    [self.libraryButton autoSetDimensionsToSize:CGSizeMake(CC_IMAGE_SIZE, CC_IMAGE_SIZE)];
}

#pragma mark - Actions

- (void)chooseChallySocialType:(UIButton *)button
{
    ChallangeSocilTypeViewController *challangeSocialTypeVC = [[ChallangeSocilTypeViewController alloc] initWithFrame:self.view.frame];
    [challangeSocialTypeVC setDelegate:self];
    challangeSocialTypeVC.providesPresentationContextTransitionStyle = true;
    challangeSocialTypeVC.definesPresentationContext = true;
    challangeSocialTypeVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self.tabBarController.navigationController presentViewController:challangeSocialTypeVC animated:NO completion:nil];
}

- (void)createChally:(UIButton *)button
{
    
}

- (void)openSetings:(UIButton *)button
{
    
}

- (void)attachFile:(UIButton *)button
{
    
}

- (void)showStrickers:(UIButton *)button
{
    
}

- (void)showMedia:(UIButton *)button
{
    
}

- (void)openImagePickerWithType:(UIButton *)sender
{
    UIImagePickerControllerSourceType sourceType = sender.tag == 0 ? UIImagePickerControllerSourceTypeCamera : UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.allowsEditing = NO;
    picker.delegate = self;
    picker.sourceType = sourceType;
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)showTabBar:(UIButton *)sender
{
    [(TabBarController *)self.tabBarController showTabBar];
}

- (void)openMapVC
{
    MapViewController *mapVC = [MapViewController new];
    [self.tabBarController.navigationController presentViewController:mapVC animated:YES completion:^{
        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }];
}

#pragma mark - ChallangeSocialType delegate

- (void)clickButtonAtTag:(NSInteger)tag
{
    NSString *title = tag == 0 ? @"Public" : @"Private";
    [self.socialTypeButton setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Textfield delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    
    return YES;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
//    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
//    CGSize newSize = [Utils countNewSizeWithFixedWidth:IMAGE_MAX_WIDTH andSize:image.size];
//    UIImage *newImage = [Utils imageWithImage:image scaledToSize:newSize];
//    
//    ConfirmPhotoViewController *confirmViewController = [[ConfirmPhotoViewController alloc] initWithImage:newImage];
//    confirmViewController.mainVC = self;
    [picker dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController pushViewController:confirmViewController animated:YES];
}

#pragma mark - Intalization

- (UIView *)headerView
{
    if (!_headerView) {
        _headerView = [UIView newAutoLayoutView];
        [_headerView setBackgroundColor:[UIColor whiteColor]];
    }
    return _headerView;
}

- (UIImageView *)avatraImageView
{
    if (!_avatraImageView) {
        _avatraImageView = [UIImageView newAutoLayoutView];
        [_avatraImageView setImage:[UIImage imageNamed:@"avatar.png"]];
        [_avatraImageView.layer setMasksToBounds:YES];
        [_avatraImageView.layer setCornerRadius:avatarImageHeight/2];
    }
    
    return _avatraImageView;
}

- (UIButton *)socialTypeButton
{
    if (!_socialTypeButton) {
        _socialTypeButton = [UIButton newAutoLayoutView];
        [_socialTypeButton setImage:[UIImage imageNamed:@"socialTypeGlobus.png"] forState:UIControlStateNormal];
        [_socialTypeButton setImageEdgeInsets:UIEdgeInsetsMake(2, 0, 2, 102)];
        [_socialTypeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -28, 0, 0)];
        [_socialTypeButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [_socialTypeButton setTitle:@"Public" forState:UIControlStateNormal];
        [_socialTypeButton.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_socialTypeButton setTitleColor:LIGHTBLUE forState:UIControlStateNormal];
        [_socialTypeButton addTarget:self action:@selector(chooseChallySocialType:) forControlEvents:UIControlEventTouchUpInside];
    }
   return _socialTypeButton;
}

- (UIButton *)createButton
{
    if (!_createButton) {
        _createButton = [UIButton newAutoLayoutView];
        [_createButton setImage:[UIImage imageNamed:@"createChally.png"] forState:UIControlStateNormal];
        [_createButton addTarget:self action:@selector(createChally:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _createButton;
}

- (UIButton *)addLocationButton
{
    if (!_addLocationButton) {
        _addLocationButton = [UIButton newAutoLayoutView];
        [_addLocationButton setImage:[UIImage imageNamed:@"locationIcon.png"] forState:UIControlStateNormal];
        [_addLocationButton setImageEdgeInsets:UIEdgeInsetsMake(7, 0, 7, 102)];
        [_addLocationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -20, 0, 0)];
        [_addLocationButton setTitle:@"Add a location" forState:UIControlStateNormal];
        [_addLocationButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [_addLocationButton.titleLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_addLocationButton addTarget:self action:@selector(openMapVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addLocationButton;
}

- (UIImageView *)smileImageView
{
    if (!_smileImageView) {
        _smileImageView = [UIImageView newAutoLayoutView];
        [_smileImageView setImage:[UIImage imageNamed:@"smile.png"]];
    }
    return _smileImageView;
}

- (UITextField*)textField
{
    if (!_textField) {
        _textField = [UITextField newAutoLayoutView];
        _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Write the challange..." attributes:@{NSForegroundColorAttributeName:LIGHT_GRAY}];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.font = [UIFont systemFontOfSize:12.0];
        [_textField setDelegate:self];
    }
    return _textField;
}

- (UIView *)mediaContentView
{
    if (!_mediaContentView) {
        _mediaContentView = [UIView newAutoLayoutView];
        [_mediaContentView setBackgroundColor:[UIColor whiteColor]];
    }
    return _mediaContentView;
}

- (UIView *)headerMediaView
{
    if (!_headerMediaView) {
        _headerMediaView = [UIView newAutoLayoutView];
        [_headerMediaView setBackgroundColor:LIGHT_GRAY];
    }
    
    return _headerMediaView;
}

- (UIButton *)mediSettingsButton
{
    if (!_mediaSettingsButton) {
        _mediaSettingsButton = [UIButton newAutoLayoutView];
        [_mediaSettingsButton setImage:[UIImage imageNamed:@"settingsIcon.png"] forState:UIControlStateNormal];
        [_mediaSettingsButton addTarget:self action:@selector(openSetings:) forControlEvents:UIControlEventTouchUpInside];
        [_mediaSettingsButton setImageEdgeInsets:UIEdgeInsetsMake(10, 13, 10, 13)];
    }
    return _mediaSettingsButton;
}

- (UIButton *)mediaAttachButton
{
    if (!_mediaAttachButton) {
        _mediaAttachButton = [UIButton newAutoLayoutView];
        [_mediaAttachButton setImage:[UIImage imageNamed:@"attachIcon.png"] forState:UIControlStateNormal];
        [_mediaAttachButton addTarget:self action:@selector(attachFile:) forControlEvents:UIControlEventTouchUpInside];
        [_mediaAttachButton setImageEdgeInsets:UIEdgeInsetsMake(13.5, 1.5, 13.5, 1.5)];
    }
    return _mediaAttachButton;
}

- (UIButton *)mediaStrickerButton
{
    if (!_mediaStrickerButton) {
        _mediaStrickerButton = [UIButton newAutoLayoutView];
        [_mediaStrickerButton setImage:[UIImage imageNamed:@"strickerIcon.png"] forState:UIControlStateNormal];
        [_mediaStrickerButton addTarget:self action:@selector(showStrickers:) forControlEvents:UIControlEventTouchUpInside];
        [_mediaStrickerButton setImageEdgeInsets:UIEdgeInsetsMake(10, 5, 10, 5)];
    }
    return _mediaStrickerButton;
}

- (UIButton *)mediaButton
{
    if (!_mediaButton) {
        _mediaButton = [UIButton newAutoLayoutView];
        [_mediaButton setImage:[UIImage imageNamed:@"mediaIcon.png"] forState:UIControlStateNormal];
        [_mediaButton addTarget:self action:@selector(showMedia:) forControlEvents:UIControlEventTouchUpInside];
        [_mediaButton setImageEdgeInsets:UIEdgeInsetsMake(10, 2.5, 10, 2.5)];
    }
    return _mediaButton;
}

- (UIButton *)cameraButton
{
    if (!_cameraButton) {
        _cameraButton = [UIButton newAutoLayoutView];
        [_cameraButton setImage:[UIImage imageNamed:@"camerIcon.png"] forState:UIControlStateNormal];
        [_cameraButton addTarget:self action:@selector(openImagePickerWithType:) forControlEvents:UIControlEventTouchUpInside];
        [_cameraButton setBackgroundColor:DARK_GRAY];
        [_cameraButton setImageEdgeInsets:UIEdgeInsetsMake(CC_IMAGE_INSET, CC_IMAGE_INSET - 2, CC_IMAGE_INSET, CC_IMAGE_INSET - 2)];
        [_cameraButton setTag:0];
        [_cameraButton setTitle:@"Camera" forState:UIControlStateNormal];
        [_cameraButton setTitleEdgeInsets:UIEdgeInsetsMake(CC_IMAGE_INSET + 20, -(CC_IMAGE_INSET + 45), 0, 0)];
        [_cameraButton.titleLabel setFont:[UIFont systemFontOfSize:10.0]];

    }
    return _cameraButton;
}

- (UIButton *)libraryButton
{
    if (!_libraryButton) {
        _libraryButton = [UIButton newAutoLayoutView];
        [_libraryButton setImage:[UIImage imageNamed:@"libraryIcon.png"] forState:UIControlStateNormal];
        [_libraryButton addTarget:self action:@selector(openImagePickerWithType:) forControlEvents:UIControlEventTouchUpInside];
        [_libraryButton setBackgroundColor:DARK_GRAY];
        [_libraryButton.titleLabel setFont:[UIFont systemFontOfSize:10.0]];
        [_libraryButton setImageEdgeInsets:UIEdgeInsetsMake(CC_IMAGE_INSET, CC_IMAGE_INSET, CC_IMAGE_INSET, CC_IMAGE_INSET)];
        [_libraryButton setTag:1];
        [_libraryButton setTitle:@"All Photos" forState:UIControlStateNormal];
        [_libraryButton setTitleEdgeInsets:UIEdgeInsetsMake(CC_IMAGE_INSET + 20, -(CC_IMAGE_INSET + 45), 0, 0)];
    }
    return _libraryButton;
}

@end

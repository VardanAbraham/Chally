//
//  MapViewController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 8/22/15.
//
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "CreateChallangeViewController.h"

@interface MapViewController () <GMSMapViewDelegate>

@property (nonatomic, strong) GMSMapView *mapView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UILabel *notificationLabel;
@property (nonatomic, strong) NSLayoutConstraint *notificationOffsetConstraints;
@end


@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addUIObjects];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self showNotificationLabel];
}

#pragma mark - Custom methods

- (void)addUIObjects
{
    [self.view addSubview:self.mapView];
    [self.mapView addSubview:self.closeButton];
    [self.mapView addSubview:self.notificationLabel];
    
    [self setConstraints];
}

- (void)setConstraints
{
    [self.mapView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:MC_INSET];
    [self.closeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:MC_INSET];
    [self.closeButton autoSetDimensionsToSize:CGSizeMake(MC_BUTTON_SIZE, MC_BUTTON_SIZE)];
    
   self.notificationOffsetConstraints = [self.notificationLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:self.mapView withOffset:-50];
    [self.notificationLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:MC_INSET];
    [self.notificationLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:MC_INSET];
    [self.notificationLabel autoSetDimension:ALDimensionHeight toSize:MC_NOTIFICATION_HEIGHT];
}

- (void)showNotificationLabel
{
    self.notificationOffsetConstraints.constant = MC_ANIM_DISTANCE;
    [self.mapView setNeedsUpdateConstraints];
    [UIView animateWithDuration:1.5   animations:^{
        [self.mapView layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.notificationOffsetConstraints.constant =  MC_ANIM_DISTANCE*-1;
        [self.mapView setNeedsUpdateConstraints];
        [UIView animateWithDuration:1.5 delay:3 options:UIViewAnimationOptionCurveEaseIn animations:^{
            [self.mapView layoutIfNeeded];
        } completion:^(BOOL finished) {
        }];
    }];
}


#pragma mark - Actions

- (void)closePage
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MapView Delegates

- (void)mapView:(GMSMapView *)googleMapView
didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate
{
    GMSMarker *marker = [GMSMarker new];
    marker.position = coordinate;
    marker.map = _mapView;
}

#pragma mark - Initalization

- (GMSMapView *)mapView
{
    if (!_mapView) {
        _mapView = [GMSMapView newAutoLayoutView];
        _mapView.myLocationEnabled = YES;
        [_mapView setDelegate:self];
        [_mapView setCamera:[GMSCameraPosition cameraWithLatitude:-33.86 longitude:151.20 zoom:6]];
    }
    return _mapView;
}

- (UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton newAutoLayoutView];
        [_closeButton setImage:[UIImage imageNamed:@"close.png"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _closeButton;
}

- (UILabel *)notificationLabel{
    if (!_notificationLabel) {
        _notificationLabel = [UILabel newAutoLayoutView];
        [_notificationLabel setBackgroundColor:[UIColor whiteColor]];
        [_notificationLabel.layer setCornerRadius:10.f];
        [_notificationLabel setClipsToBounds:TRUE];
        [_notificationLabel setText:@"Add your location for challange"];
        [_notificationLabel setTextAlignment:NSTextAlignmentCenter];
        [_notificationLabel setTextColor:LIGHTBLUE];
    }
    return _notificationLabel;
}

@end

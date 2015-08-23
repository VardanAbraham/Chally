//
//  AppDelegate.h
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//
//

#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;


@end


//
//  AppDelegate.m
//  Chally
//
//  Created by Vardan Abrahamyan on 2/1/15.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "RegisterViewController.h"
#import "RegisterViewController.h"
#import <GooglePlus/GooglePlus.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initLocationManager];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    if ([Utils isUserRegistered]) {
        self.window.rootViewController = [UIHelper getTabBar];
    } else {
        RegisterViewController *registerViewController = [RegisterViewController new];
        
        UINavigationController *registerNavigation = [[UINavigationController alloc] initWithRootViewController:registerViewController];
        [registerNavigation.navigationBar setBarTintColor:LIGHTBLUE];
        
        self.window.rootViewController = registerNavigation;
    }
    [self.window makeKeyAndVisible];
    [GMSServices provideAPIKey:@"AIzaSyAeaZJ08uaduWOvl-Wu-EMmpnlf60yPxRc"];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [FBSDKAppEvents activateApp];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if ([[NSString stringWithFormat:@"%@", url] hasPrefix:@"fb"]) {
        return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                              openURL:url
                                                    sourceApplication:sourceApplication
                                                           annotation:annotation];
    } else {
        return [GPPURLHandler handleURL:url sourceApplication:sourceApplication annotation:annotation];
    }
}

#pragma mark - Custom Methods

- (void)initLocationManager
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager startUpdatingLocation];
}

#pragma mark - Location manager delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.lastObject;
    NSNumber *lng = [[NSNumber alloc] initWithDouble:location.coordinate.longitude];
    NSNumber *lat = [[NSNumber alloc] initWithDouble:location.coordinate.latitude];
    
    if ([lat doubleValue] != 0 && [lng doubleValue] != 0) {
        [Utils saveUserLat:@44];
        [Utils saveUserLng:@44];
    }
}



@end

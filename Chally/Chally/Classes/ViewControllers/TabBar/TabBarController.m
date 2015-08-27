//
//  TabBarController.m
//  Chally
//
//  Created by Vardan Abrahamyan on 3/1/15.
//
//

#import "TabBarController.h"
#import "NewsFeedViewController.h"
#import "ExploreViewController.h"
#import "CreateChallangeViewController.h"
#import "NearByViewController.h"
#import "MyProfileViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTabBarViewControllers];
    [self setDelegate:self];
}

- (void)setTabBarViewControllers
{
    UIColor *navigationBGColor = [UIColor colorWithRed:0.0/255.0f green:182.0/255.0f blue:203.0/255.0f alpha:1.0f];
    
    NewsFeedViewController *newsFeedVC = [NewsFeedViewController new];
    UINavigationController *feedNavigation = [[UINavigationController alloc] initWithRootViewController:newsFeedVC];
    [feedNavigation.navigationBar setBarTintColor:navigationBGColor];
    [feedNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:22.0]}];
    [feedNavigation.tabBarItem setImage:[[UIImage imageNamed:@"Feed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [feedNavigation.tabBarItem setSelectedImage:[[UIImage imageNamed:@"FeedActive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [feedNavigation.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : navigationBGColor }     forState:UIControlStateSelected];
    [feedNavigation.tabBarItem setTitle:@"Feed"];

    ExploreViewController *exploreVC = [ExploreViewController new];
    UINavigationController *exploreNavigation = [[UINavigationController alloc] initWithRootViewController:exploreVC];
    [exploreNavigation.navigationBar setBarTintColor:navigationBGColor];
    [exploreNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:22.0]}];
    [exploreNavigation.tabBarItem setImage:[[UIImage imageNamed:@"Explore"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [exploreNavigation.tabBarItem setSelectedImage:[[UIImage imageNamed:@"ExploreActive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [exploreNavigation.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : navigationBGColor }     forState:UIControlStateSelected];
    [exploreNavigation.tabBarItem setTitle:@"Explore"];

    CreateChallangeViewController *createChallangeVC = [CreateChallangeViewController new];
    UINavigationController *createChallangeNavigation = [[UINavigationController alloc] initWithRootViewController:createChallangeVC];
    [createChallangeNavigation.navigationBar setBarTintColor:navigationBGColor];
    [createChallangeNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:22.0] }];
    [createChallangeNavigation.tabBarItem setImage:[[UIImage imageNamed:@"CreateChallange"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [createChallangeNavigation.tabBarItem setSelectedImage:[[UIImage imageNamed:@"CreateChallangeActive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [createChallangeNavigation.tabBarItem setImageInsets:UIEdgeInsetsMake(5, 0, -5, 0)];
    [createChallangeNavigation.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : navigationBGColor }     forState:UIControlStateSelected];
    [createChallangeNavigation.tabBarItem setTitle:@""];

    NearByViewController *nearByVC = [NearByViewController new];
    UINavigationController *nearByNavigation = [[UINavigationController alloc] initWithRootViewController:nearByVC];
    [nearByNavigation.navigationBar setBarTintColor:navigationBGColor];
    [nearByNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:22.0]}];
    [nearByNavigation.tabBarItem setImage:[[UIImage imageNamed:@"Nearby"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nearByNavigation.tabBarItem setSelectedImage:[[UIImage imageNamed:@"NearbyActive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nearByNavigation.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : navigationBGColor }     forState:UIControlStateSelected];
    [nearByNavigation.tabBarItem setTitle:@"Near By"];

    MyProfileViewController *myProfileVC = [MyProfileViewController new];
    UINavigationController *profileNavigation = [[UINavigationController alloc] initWithRootViewController:myProfileVC];
    [profileNavigation.navigationBar setBarTintColor:navigationBGColor];
    [profileNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont fontWithName:@"OpenSans" size:22.0]}];
    [profileNavigation.tabBarItem setImage:[[UIImage imageNamed:@"Profile"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [profileNavigation.tabBarItem setSelectedImage:[[UIImage imageNamed:@"ProfileActive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [profileNavigation.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : navigationBGColor }     forState:UIControlStateSelected];
    [profileNavigation.tabBarItem setTitle:@"Profile"];

    [self setViewControllers:@[feedNavigation, exploreNavigation, createChallangeNavigation, nearByNavigation, profileNavigation]];
    
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    UINavigationController * navigationCOntroller = (UINavigationController *)viewController;
    if ([navigationCOntroller.viewControllers[0] isKindOfClass:[CreateChallangeViewController class]]) {
        self.lastVCIndex = [tabBarController.viewControllers indexOfObject:tabBarController.selectedViewController];
        [self changeTabBarState:NO];
    }
    
    return YES;
}

- (void)showTabBar
{
    [self changeTabBarState:YES];
    [self setSelectedIndex:self.lastVCIndex];
}

- (void)changeTabBarState:(BOOL)show
{
    CGFloat height = self.tabBar.frame.size.height;
    CGFloat offsetY = show? -height : height;
    
    [UIView animateWithDuration:0.5 animations:^{
        self.tabBar.frame = CGRectOffset(self.tabBar.frame, 0, offsetY);
    } completion:nil];
}

@end

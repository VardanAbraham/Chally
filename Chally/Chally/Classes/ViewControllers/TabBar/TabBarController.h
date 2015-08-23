//
//  TabBarController.h
//  Chally
//
//  Created by Vardan Abrahamyan on 3/1/15.
//
//

@interface TabBarController : UITabBarController <UITabBarControllerDelegate>

@property (nonatomic, assign) NSInteger lastVCIndex;

- (void)showTabBar;

@end

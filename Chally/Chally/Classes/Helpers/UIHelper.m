//
//  HUIHelper.m
//  Hive
//
//  Created by Vardan Gevorgyan on 8/27/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

#import "UIHelper.h"
#import "TabBarController.h"

@implementation UIHelper

+ (void)showLoading
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
}

+ (void)dismissLoading
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
}

+ (void)shakeWithView:(UITextField*)textField iterations:(int)iterations direction:(int)direction size:(int)size {
    [UIView animateWithDuration:0.09-(iterations*.01) animations:^{
        textField.transform = CGAffineTransformMakeTranslation(size*direction, 0);
    } completion:^(BOOL finished) {
        if (iterations >= 5 || size <= 0) {
            textField.transform = CGAffineTransformIdentity;
            return;
        }
        [self shakeWithView:textField iterations:iterations+1 direction:direction*-1 size:MAX(0, size-1)];
    }];
}

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlertWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chally"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)showAlertWithMessageWithoutTitle:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

+ (void)showDialogWithMessage:(NSString *)message withDelegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Chally"
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

+ (UINavigationController *)getTabBar
{
    [Utils setUserRegistered:1];
    TabBarController *tabBar = [TabBarController new];
    UINavigationController *tabbarNavigation = [[UINavigationController alloc] initWithRootViewController:tabBar];
    [tabbarNavigation.navigationBar setBarTintColor:[UIColor colorWithRed:0.0/255.0f green:182.0/255.0f blue:203.0/255.0f alpha:1.0f]];
    [tabBar setTitle:@"Chally"];
    [tabbarNavigation.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : OPENSANS_REGULIAR }];

    return tabbarNavigation;
}

@end

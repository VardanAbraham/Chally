//
//  HUIHelper.h
//  Hive
//
//  Created by Vardan Gevorgyan on 8/27/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

@interface UIHelper : NSObject

+ (void)showLoading;
+ (void)dismissLoading;
+ (void)shakeWithView:(UITextField*)textField iterations:(int)iterations direction:(int)direction size:(int)size;
+ (void)showDialogWithMessage:(NSString *)message withDelegate:(id)delegate;
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message;
+ (void)showAlertWithMessage:(NSString *)message;
+ (void)showAlertWithMessageWithoutTitle:(NSString *)message;
+ (UINavigationController *)getTabBar;
@end

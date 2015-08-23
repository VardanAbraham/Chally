//
//  Utils.h
//  Hive
//
//  Created by Vardan Gevorgyan on 8/27/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

@interface Utils : NSObject <UIAlertViewDelegate>

+ (void)saveToUserDefaultsWithKey:(NSString *)key value:(id)value;
+ (id)readFromUserDefaults:(NSString *)key;
+ (BOOL)isValidEmail:(NSString*) emailString;
+ (BOOL)isNetworkConnected;
+ (void)setUserRegistered:(NSInteger)value;
+ (BOOL)isUserRegistered;
+ (void)saveAuthToken:(NSString*)value;
+ (void)saveDeviceType:(NSString*)value;
+ (NSString*)getAuthToken;
+ (NSString*)getDeviceType;
+ (BOOL)isValidTextField:(UITextField *)field;
@end
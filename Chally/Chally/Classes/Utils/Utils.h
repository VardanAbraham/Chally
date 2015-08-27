//
//  Utils.h
//  Hive
//
//  Created by Vardan Gevorgyan on 8/27/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface Utils : NSObject <UIAlertViewDelegate>

+ (void)saveToUserDefaultsWithKey:(NSString *)key value:(id)value;
+ (id)readFromUserDefaults:(NSString *)key;
+ (BOOL)isValidEmail:(NSString*) emailString;
+ (BOOL)isNetworkConnected;
+ (void)setUserRegistered:(NSInteger)value;
+ (BOOL)isUserRegistered;
+ (BOOL)isValidTextField:(UITextField *)field;
+ (void)saveUserLat:(NSNumber *)lat;
+ (void)saveUserLng:(NSNumber *)lng;
+ (NSNumber *)getUserLat;
+ (NSNumber *)getUserLng;

@end
//
//  Utils.m
//  Hive
//
//  Created by Vardan Gevorgyan on 8/27/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

#import "Utils.h"
#import "Reachability.h"
#import "AFNetworkReachabilityManager.h"

@implementation Utils

+ (void)saveToUserDefaultsWithKey:(NSString *)key value:(id)value
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setObject:value forKey:key];
        [standardUserDefaults synchronize];
    }
}

+ (id)readFromUserDefaults:(NSString *)key
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        return [standardUserDefaults objectForKey:key];
    }
    
    return nil;
}

+ (BOOL)isValidEmail:(NSString*) emailString
{
    if([emailString length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

+ (void)setUserRegistered:(NSInteger)value
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if (standardUserDefaults) {
        [standardUserDefaults setInteger:value forKey:@"registered"];
        [standardUserDefaults synchronize];
    }
}

+ (BOOL)isUserRegistered
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if (standardUserDefaults) {
        return [[standardUserDefaults objectForKey:@"registered"] boolValue];
    }
    return NO;
}


+ (BOOL)isNetworkConnected
{
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    return !(networkStatus == NotReachable);
}

+ (NSString*)getSelectedFilesHiveIDsString:(NSMutableArray*)selectedFiles
{
    if ([selectedFiles count] > 0) {
    NSString *hiveIDs = [selectedFiles objectAtIndex:0];
    for (int i = 1; i < [selectedFiles count]; i++) {
        hiveIDs = [hiveIDs stringByAppendingString:[NSString stringWithFormat:@"%@%@",@"|",[selectedFiles objectAtIndex:i]]];
    }
    
    return hiveIDs;
    }
    return @"";
}

+ (NSString*)getFilePathWithName:(NSString*)fileName format:(NSString*)fileFormat
{
    fileName = [NSString stringWithFormat:@"%@.%@",fileName, fileFormat];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];

    return path;
}

+ (NSString*)getFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    
    return path;
}

// mostliy used to sort qualities of video or audio

+ (NSMutableArray*)sortArray:(NSMutableArray*)array
{
    for (int j = 0; j < [array count]; j++) {
        if (j > 0) {
            NSString *quality1 = array[j];
            NSString *quality2 = array[j-1];
            if ([quality2 integerValue] > [quality1 integerValue] ) {
                [array replaceObjectAtIndex:j withObject:quality2];
                [array replaceObjectAtIndex:j-1 withObject:quality1];
                j-=2;
            }
        }
    }
    
    return array;
}

+ (BOOL)isValidTextField:(UITextField *)field
{
    BOOL isValid = NO;
    NSString *kText = [field.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    ![kText isEqualToString:@""] ? isValid = YES : [UIHelper shakeWithView:field iterations:0 direction:1 size:4];
    
    return isValid;
}

+ (void)saveUserLat:(NSNumber *)lat
{
    [self saveToUserDefaultsWithKey:@"lat" value:lat];
}

+ (void)saveUserLng:(NSNumber *)lng
{
    [self saveToUserDefaultsWithKey:@"lng" value:lng];
}

+ (NSNumber *)getUserLat
{
    return [self readFromUserDefaults:@"lat"];
}

+ (NSNumber *)getUserLng
{
    return [self readFromUserDefaults:@"lng"];
}


@end
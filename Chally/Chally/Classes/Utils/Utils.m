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

+ (void)saveAuthToken:(NSString*)value
{
    [self saveToUserDefaultsWithKey:@"auth" value:value];
}

+ (void)saveDeviceType:(NSString*)value
{
    [self saveToUserDefaultsWithKey:@"deviceType" value:value];
}

+ (void)saveFriendsUserIDs:(NSMutableArray*)userIDs
{
    [self saveToUserDefaultsWithKey:@"userIDs" value:userIDs];
}

+ (void)saveTrashHiveID:(NSString*)trashHiveID
{
    [self saveToUserDefaultsWithKey:@"trashHiveID" value:trashHiveID];
}

+ (void)saveVideoHiveID:(NSString*)videoHiveID
{
    [self saveToUserDefaultsWithKey:@"videoHiveID" value:videoHiveID];
}

+ (void)saveAlbumHiveID:(NSString*)albumHiveID
{
    [self saveToUserDefaultsWithKey:@"albumHiveID" value:albumHiveID];
}

+ (void)savePhotoHiveID:(NSString*)photoHiveID
{
    [self saveToUserDefaultsWithKey:@"photoHiveID" value:photoHiveID];
}

+ (void)saveDocumentsHiveID:(NSString*)documentsHiveID
{
    [self saveToUserDefaultsWithKey:@"documentsHiveID" value:documentsHiveID];
}

+ (void)saveFriendsList:(NSMutableArray*)friendsList
{
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:friendsList];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:encodedObject forKey:@"friendsList"];
    [defaults synchronize];
}

+ (NSMutableArray*)getFriendsList
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"friendsList"];
    NSMutableArray *friendsList = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    return friendsList;
}

+ (NSMutableArray*)getFriendsUserIDs
{
    return [self readFromUserDefaults:@"userIDs"];
}

+ (NSString*)getAuthToken
{
    return [self readFromUserDefaults:@"auth"];
}

+ (NSString*)getDeviceType
{
    return [self readFromUserDefaults:@"deviceType"];
}

+ (NSString*)getTrashHiveID
{
    return [self readFromUserDefaults:@"trashHiveID"];
}

+ (NSString*)getVideoHiveID
{
    return [self readFromUserDefaults:@"videoHiveID"];
 }

+ (NSString*)getAlbumHiveID
{
    return [self readFromUserDefaults:@"albumHiveID"];
}

+ (NSString*)getPhotoHiveID
{
    return [self readFromUserDefaults:@"photoHiveID"]; 
}

+ (NSString*)getDocumentsHiveID
{
    return [self readFromUserDefaults:@"documentsHiveID"];
}

+ (void)saveCutedFilesIDs:(NSMutableArray*)hiveIDs
{
    if ([self getCutedFilesIDs]) {
        NSMutableArray *mainIDs = [NSMutableArray arrayWithArray:[self getCutedFilesIDs]];
        [mainIDs addObjectsFromArray:hiveIDs];
        [self saveToUserDefaultsWithKey:@"cutedFilesIDs" value:mainIDs];
    } else {
        [self saveToUserDefaultsWithKey:@"cutedFilesIDs" value:hiveIDs];
    }
}

+ (void)saveCopiedFilesIDs:(NSMutableArray*)hiveIDs
{
    if ([self getCopiedFilesIDs]) {
        NSMutableArray *mainIDs = [NSMutableArray arrayWithArray:[self getCopiedFilesIDs]];
        [mainIDs addObjectsFromArray:hiveIDs];
        [self saveToUserDefaultsWithKey:@"copiedFilesIDs" value:mainIDs];
    } else {
        [self saveToUserDefaultsWithKey:@"copiedFilesIDs" value:hiveIDs];
    }
}

+ (NSMutableArray*)getCutedFilesIDs
{
    return [self readFromUserDefaults:@"cutedFilesIDs"];
}

+ (NSMutableArray*)getCopiedFilesIDs
{
    return [self readFromUserDefaults:@"copiedFilesIDs"];
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

+ (BOOL)isUserFriend:(int)userID
{
    BOOL returnedValue = NO;
    NSMutableArray *userIDs = [self getFriendsUserIDs];
    for (int i = 0; i <[userIDs count]; i++) {
        if (userID == [[userIDs objectAtIndex:i] integerValue]) {
            returnedValue = YES;
        }
    }
    return returnedValue;
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

@end
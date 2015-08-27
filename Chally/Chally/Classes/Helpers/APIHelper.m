//
//  HAPIHelper.m
//  Hive
//
//  Created by Vardan Gevorgyan on 6/9/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"
#import "UIAlertView+AFNetworking.h"
#import "AFHTTPSessionManager.h"
#import "APIHelper.h"
#import "APIClient.h"

@implementation APIHelper

+ (instancetype)sharedAPIHelper {
    static APIHelper *_sharedAPIHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedAPIHelper = [APIHelper new];
    });
    
    return _sharedAPIHelper;
}

- (NSURLSessionDataTask *)requestDataWithURL:(NSString *)URL params:(NSDictionary *)parameters constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block {
    return [[APIClient sharedClient] POST:URL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([self checkResponseStatus:responseObject]) {
            NSDictionary *data = [responseObject valueForKeyPath:@"data"];
            if (data) {
                if (block) {
                    block([NSDictionary dictionaryWithDictionary:data], nil);
                }
            } else if (block) {
                block([NSDictionary dictionary], [NSError errorWithDomain:@"Chally" code:200 userInfo:[NSDictionary dictionary]]);
            }
        } else if (block) {
            [self handleError:responseObject];
            block([NSDictionary dictionary], [NSError errorWithDomain:@"Chally" code:200 userInfo:[NSDictionary dictionary]]);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([NSDictionary dictionary], error);
        }
    }];
}

- (NSURLSessionDataTask *)requestWithURL:(NSString *)URL params:(id)parameters constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block
{
    return [[APIClient sharedClient] POST:URL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([self checkResponseStatus:responseObject]) {
            if (block) {
                block([NSDictionary dictionaryWithDictionary:responseObject], nil);
            }
        } else if (block) {
            [self handleError:responseObject];
            block([NSDictionary dictionary], [NSError errorWithDomain:@"Hive" code:200 userInfo:[NSDictionary dictionary]]);
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (block) {
            block([NSDictionary dictionary], error);
        }
    }];
}

- (NSURLSessionTask *)getCommentsWithParams:(NSDictionary *)params constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block
{
    return [self requestWithURL:@"ComentsURL" params:params constructingBodyWithBlock:^(NSDictionary *data, NSError *error) {
    }];
}

//- (void)curlFunctionWithUrl:(NSString*)URL
//{
//    NSString *myString=URL;
//    NSRange range = [URL rangeOfString:@"?" options:NSBackwardsSearch range:NSMakeRange(0, URL.length)];
//    NSString *dataString = [myString substringFromIndex:range.location+1];
//    NSString *url = [myString substringToIndex:range.location ];
//    NSString *auth = [NSString stringWithFormat:@" --header \"Client-Type: %@\" --header \"Client-Version: 0.1\"", [Utils getDeviceType]];
//    if ([Utils getAuthToken]) {
//        auth =  [auth stringByAppendingString:[NSString stringWithFormat:@" --header \"Authorization: %@\"", [Utils getAuthToken]]];
//    }
//    NSString *xdebug = @" --data 'XDEBUG_SESSION_START=hive'";
//    NSString *post = @"";
//    if (dataString) {
//        post = [NSString stringWithFormat:@" --data '%@'", dataString];
//    }
//    NSString *curl = [NSString stringWithFormat:@"curl -X POST \"%@\"%@%@%@",url, post,xdebug,auth];
//    NSLog(@"%@", curl);
//}

- (BOOL)checkResponseStatus:(id)responseObject {
    
    int code = [([responseObject valueForKeyPath:@"code"]) intValue];
    if (code == 0) {
        return YES;
    } else {
        return NO;
    }
}

- (void)handleError:(id)responseObject
{
    NSString *errorMessage = [responseObject valueForKeyPath:@"msg"];
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Error"
                                                      message:errorMessage
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

@end

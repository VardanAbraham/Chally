//
//  APIClient.m
//  Chally
//
//  Created by Vardan Abrahamyan on 30/2/2015.
//  Copyright (c) 2015 Vardan Abrahamyan. All rights reserved.
//

#import "APIClient.h"

@implementation APIClient

+ (instancetype)sharedClient {
    static APIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[APIClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.hive.im"]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer = [AFHTTPRequestSerializer serializer];

    });
    
    return _sharedClient;
}

@end

//
//  HAPIHelper.h
//  Hive
//
//  Created by Vardan Gevorgyan  on 6/9/14.
//  Copyright (c) 2014 Vardan Gevorgyan. All rights reserved.
//

@interface APIHelper : NSObject

+ (instancetype)sharedAPIHelper;

- (NSURLSessionDataTask *)requestDataWithURL:(NSString *)URL params:(NSDictionary*)parameters constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block;
- (NSURLSessionDataTask *)requestWithURL:(NSString *)URL params:(id)parameters constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block;
- (NSURLSessionTask *)getCommentsWithParams:(NSDictionary *)params constructingBodyWithBlock:(void (^)(NSDictionary *data, NSError *error))block;

@end
//
//  APIClient.h
//  Chally
//
//  Created by Vardan Abrahamyan on 30/2/2015.
//  Copyright (c) 2015 Vardan Abrahamyan. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

//
//  CEReachabilityManager.h
//  Cencrypt
//
//  Created by asadrehman on 14/04/2014.
//  Copyright (c) 2014 Axact. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Reachability/Reachability.h>
#define isInternetAvailable [CEReachabilityManager isReachable]
#define NetworkManager [CEReachabilityManager sharedManager]
@class Reachability;
@interface CEReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark -
#pragma mark Shared Manager
+ (CEReachabilityManager *)sharedManager;

#pragma mark -
#pragma mark Class Methods
+ (BOOL)isReachable;

@end

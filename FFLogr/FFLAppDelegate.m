//
//  FFLAppDelegate.m
//  FFLogr
//
//  Created by Erik Weiss on 6/27/13.
//  Copyright (c) 2013 Flashforward Labs. All rights reserved.
//

#import "FFLAppDelegate.h"
#import "FFLogr.h"

static NSString *const kNetworkLogger = @"Network";
static NSString *const kDataAccessLogger = @"DataAccess";
static NSString *const kAnimationLogger = @"Animation";
static NSString *const kSomeOtherLogger = @"SomeOtherLogger";

@implementation FFLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[FFLogr sharedInstance] setLevel:LOG_LEVEL_ERROR forLogger:kNetworkLogger];
    [[FFLogr sharedInstance] setLevel:LOG_LEVEL_WARN forLogger:kDataAccessLogger];
    [[FFLogr sharedInstance] setLevel:LOG_LEVEL_DEBUG forLogger:kAnimationLogger];
    [[FFLogr sharedInstance] setLevel:LOG_LEVEL_OFF forLogger:kSomeOtherLogger];
    
    FFLogError(kNetworkLogger, @"Network Error Test %@", @"123");   // Will display
    FFLogWarn(kNetworkLogger, @"Network Warn Test %@", @"123");     // Won't display
    FFLogDebug(kNetworkLogger, @"Network Debug Test %@", @"123");   // Won't display
    
    FFLogError(kDataAccessLogger, @"DataAccess Error Test %@", @"123");// Will display
    FFLogWarn(kDataAccessLogger, @"DataAccess Warn Test %@", @"123");  // Will display
    FFLogDebug(kDataAccessLogger, @"DataAccess Debug Test %@", @"123");// Won't display
    
    FFLogError(kAnimationLogger, @"Animation Error Test %@", @"123"); // Will display
    FFLogWarn(kAnimationLogger, @"Animation Warn Test %@", @"123");   // Will display
    FFLogDebug(kAnimationLogger, @"Animation Debug Test %@", @"123"); // Will display
    
    FFLogError(kSomeOtherLogger, @"Other Error Test %@", @"123"); // Won't display
    FFLogWarn(kSomeOtherLogger, @"Other Warn Test %@", @"123");   // Won't display
    FFLogDebug(kSomeOtherLogger, @"Other Debug Test %@", @"123"); // Won't display
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

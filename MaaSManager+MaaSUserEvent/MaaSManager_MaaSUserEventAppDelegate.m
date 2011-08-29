//
//  MaaSManager_MaaSUserEventAppDelegate.m
//  MaaSManager+MaaSUserEvent
//
//  Created by Collin Ruffenach on 8/29/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <MaaSive/MaaSive.h>
#import "MaaSManager+MaaSUserEvent.h"
#import "MaaSManager_MaaSUserEventAppDelegate.h"
#import "MaaSUserEvent.h"

@implementation MaaSManager_MaaSUserEventAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	MaaSManager *manager = [MaaSManager sharedManager];

#warning Create and app and fill in custom app id and secret key to run the test on your own MaaSive account.

	[manager setAppId:@""];
	[manager setSecretKey:@""];
	
	[manager startTrackingUserSessions];
	
	// Override point for customization after application launch.
	[self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

-(IBAction)startNotifications:(id)sender {

	[[MaaSManager sharedManager] startTrackingUserSessions];
} 
-(IBAction)stopNotifications:(id)sender {

	[[MaaSManager sharedManager] stopTrackingUserSessions];
}

-(IBAction)clearTestData:(id)sender {

	[MaaSUserEvent findRemoteWithQuery:[NSDictionary dictionary]
						  cacheResults:NO
					   completionBlock:^(NSArray *objects, NSError *error) {
						   [objects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
							   MaaSUserEvent *event = (MaaSUserEvent*)obj;
							   [event removeRemote:nil];
						   }];
					   }];
}

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

@end

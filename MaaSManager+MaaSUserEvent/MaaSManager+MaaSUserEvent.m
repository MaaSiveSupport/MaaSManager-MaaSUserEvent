//
//  MaaSManager+MaaSUserEvent.m
//  MaaSManager+MaaSUserEvent
//
//  Created by Collin Ruffenach on 8/29/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "MaaSManager+MaaSUserEvent.h"
#import "MaaSUserEvent.h"

@implementation MaaSManager (MaaSManager_MaaSUserEvent)
static NSArray *observerObjects = nil;

-(void)startTrackingUserSessions {
	
	if(observerObjects == nil) {
		
		id notificationObj1;
		id notificationObj2;
		id notificationObj3;
		id notificationObj4;		
		
		NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
		notificationObj1 = [center addObserverForName:UIApplicationDidFinishLaunchingNotification 
											   object:[UIApplication sharedApplication]
												queue:nil
										   usingBlock:^(NSNotification *notification) {
											   MaaSUserEvent *event = [[MaaSUserEvent alloc] initWithEventType:kUserEventTypeAppLaunch
																										detail:nil];
											   [event saveRemote:nil];				
										   }];
		
		notificationObj2 = [center addObserverForName:UIApplicationDidEnterBackgroundNotification
											   object:[UIApplication sharedApplication]
												queue:nil
										   usingBlock:^(NSNotification *notification) {
											   MaaSUserEvent *event = [[MaaSUserEvent alloc] initWithEventType:kUserEventTypeAppEnteredBackground
																										detail:nil];
											   [event saveRemote:nil];
										   }];
		
		notificationObj3 = [center addObserverForName:UIApplicationWillEnterForegroundNotification
											   object:[UIApplication sharedApplication]
												queue:nil
										   usingBlock:^(NSNotification *notification) {
											   MaaSUserEvent *event = [[MaaSUserEvent alloc] initWithEventType:kUserEventTypeAppEnteredForeground
																										detail:nil];
											   [event saveRemote:nil];
										   }];
		
		notificationObj4 = 	[center addObserverForName:UIApplicationWillTerminateNotification
												object:[UIApplication sharedApplication]
												 queue:nil
											usingBlock:^(NSNotification *notification) {
												MaaSUserEvent *event = [[MaaSUserEvent alloc] initWithEventType:kUserEventTypeAppTerminated
																										 detail:nil];
												[event saveRemote:nil];
												
												[self stopTrackingUserSessions];
											}];	
		
		observerObjects = [[NSArray alloc] initWithObjects:notificationObj1,
						   notificationObj2,
						   notificationObj3,
						   notificationObj4, nil];
	}
}

-(void)stopTrackingUserSessions {
	
	if(observerObjects != nil) {
		
		for(id observer in observerObjects) {		
			NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
			[center removeObserver:observer];
		}
		
		observerObjects = nil;
		[observerObjects release];
	}
}

@end
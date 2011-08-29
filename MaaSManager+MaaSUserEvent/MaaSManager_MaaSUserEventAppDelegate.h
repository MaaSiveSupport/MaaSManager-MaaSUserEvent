//
//  MaaSManager_MaaSUserEventAppDelegate.h
//  MaaSManager+MaaSUserEvent
//
//  Created by Collin Ruffenach on 8/29/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaaSManager_MaaSUserEventAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)startNotifications:(id)sender;
-(IBAction)stopNotifications:(id)sender;
-(IBAction)clearTestData:(id)sender;

@end

//
//  MaaSUserEvent.h
//  Autocorrector
//
//  Created by Collin Ruffenach on 8/21/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MaaSive/MaaSive.h>

#define kUserEventTypeAppLaunch @"kUserEventTypeAppLaunch"
#define kUserEventTypeAppEnteredBackground @"kUserEventTypeAppEnteredBackground"
#define kUserEventTypeAppEnteredForeground @"kUserEventTypeAppEnteredForeground"
#define kUserEventTypeAppTerminated @"kUserEventTypeAppTerminated"
#define kUserEventTypeEnterTab @"kUserEventEnterTab"
#define kUserEventTypeLeaveTab @"kUserEventDidLeaveTab"
#define kUserEventTypeEnterViewController @"kUserEventDidEnterViewController"
#define kUserEventTypeLeaveViewController @"kUserEventDidLeaveViewController"
#define kUserEventTypeCustom @"kUserEventCustom"

@interface MaaSUserEvent : MaaSModel

@property (nonatomic, retain) NSString *eventType;
@property (nonatomic, retain) NSString *userInfo;
@property (nonatomic, retain) NSString *deviceID;

-(id)initWithEventType:(NSString*)eventType 
				detail:(NSString*)userInfo;

@end

//
//  MaaSUserEvent.m
//  Autocorrector
//
//  Created by Collin Ruffenach on 8/21/11.
//  Copyright 2011 ELC Technologies. All rights reserved.
//

#import "MaaSUserEvent.h"

@implementation MaaSUserEvent

@synthesize eventType = eventType_;
@synthesize userInfo = userInfo_;
@synthesize deviceID = deviceID_;

- (id)init
{
    self = [super init];

    if (self) {
        
    }
    
    return self;
}

-(id)initWithEventType:(NSString*)eventType 
				detail:(NSString*)userInfo {
	
	self = [super init];
	
	if(self) {
		
		NSString *uuid = [[UIDevice currentDevice] uniqueIdentifier];
		self.deviceID = uuid;
		self.eventType = eventType;
		self.userInfo = userInfo;
	}
	
	return self;
}

@end

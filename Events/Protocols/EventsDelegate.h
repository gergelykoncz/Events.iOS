//
//  EventsDelegate.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EventsDelegate <NSObject>

-(void)loadedEvents:(NSArray*)events;
-(void)errorOccurred:(NSString*)message;

@end

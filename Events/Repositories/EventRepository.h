//
//  EventRepository.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"
#import "EventsDelegate.h"
#import "EventMapper.h"

@interface EventRepository : NSObject<NSURLConnectionDataDelegate>{
    NSMutableData* requestData;
}

@property(nonatomic, retain) NSObject<EventsDelegate>* eventsDelegate;

-(void)loadEventsForDate:(NSDate*)date forDelegate:(NSObject<EventsDelegate>*)delegate;

@end

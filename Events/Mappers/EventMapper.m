//
//  EventMapper.m
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "EventMapper.h"

@implementation EventMapper

-(id)init{
    self = [super init];
    if(self){
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
        dateFormatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
        [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZ"];
    }
    return self;
}

-(Event*)mapDictionary:(NSDictionary *)dictionary{
    Event* result = [[Event alloc] init];
    result.AllDay = [[dictionary valueForKey:@"allDay"] boolValue];
    result.Description = [dictionary objectForKey:@"description"];
    result.End = [self parseISO6801Date:[dictionary objectForKey:@"end"]];
    result.Start = [self parseISO6801Date:[dictionary objectForKey:@"start"]];
    result.Summary = [dictionary objectForKey:@"summary"];
    result.UID = [dictionary objectForKey:@"uid"];
    return result;
}

-(NSDate*)parseISO6801Date:(NSString*)dateString{
    NSDate* date;
    NSString* errorString;
    [dateFormatter getObjectValue:&date forString:dateString errorDescription:&errorString];
    if(errorString){
        NSLog(@"%@", errorString);
    }
    return date;
}

@end

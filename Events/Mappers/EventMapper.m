//
//  EventMapper.m
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "EventMapper.h"

@implementation EventMapper

-(Event*)mapDictionary:(NSDictionary *)dictionary{
    Event* result = [[Event alloc] init];
    result.AllDay = [[dictionary valueForKey:@"AllDay"] boolValue];
    result.Description = [dictionary objectForKey:@"Description"];
    result.End = [dictionary objectForKey:@"End"];
    result.Start = [dictionary objectForKey:@"Start"];
    result.Summary = [dictionary objectForKey:@"Summary"];
    result.UID = [dictionary objectForKey:@"UID"];
    return result;
}

@end

//
//  EventMapper.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventMapper : NSObject{
    NSDateFormatter* dateFormatter;
}

-(Event*)mapDictionary:(NSDictionary*)dictionary;

@end

//
//  MAEventMapper.h
//  Events
//
//  Created by Gergely Koncz on 8/13/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAEvent.h"
#import "Event.h"

@interface MAEventMapper : NSObject

-(MAEvent*)map:(Event*)event;

@end

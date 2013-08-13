//
//  MAEventMapper.m
//  Events
//
//  Created by Gergely Koncz on 8/13/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "MAEventMapper.h"

@implementation MAEventMapper

-(MAEvent*)map:(Event *)event{
    MAEvent* result = [[MAEvent alloc] init];
    result.allDay = event.AllDay;
    result.displayDate = event.Start;
    result.end = event.End;
    result.start = event.Start;
    result.title = event.Summary;
    result.backgroundColor = [UIColor greenColor];
    return result;
}

@end

//
//  MAEventMapper.m
//  OfficeGuru
//
//  Created by Gergely Koncz on 11/24/12.
//  Copyright (c) 2012 Gergely Koncz. All rights reserved.
//

#import "MAEventMapper.h"

@implementation MAEventMapper

-(MAEvent*) mapEvent:(Appointment *)appointment{
    MAEvent* result = [[MAEvent alloc] init];
    result.allDay = appointment.AllDay;
    result.backgroundColor = appointment.Color;
    result.displayDate = appointment.Start;
    result.end = appointment.End;
    result.start = appointment.Start;
    result.title = appointment.Summary;
    result.backgroundColor = appointment.Color;
    return result;
}

@end

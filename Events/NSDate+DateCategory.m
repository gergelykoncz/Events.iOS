//
//  NSDate+DateCategory.m
//  Geronimo
//
//  Created by Gergely Koncz on 8/11/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "NSDate+DateCategory.h"

@implementation NSDate (DateCategory)

-(NSDate*)yesterday{
    return [self calculateDateWithOffset:-1];
}

-(NSDate*)tomorrow{
    return [self calculateDateWithOffset:1];
}

-(NSDate*)calculateDateWithOffset:(int)daysOffset{
    // set up date components
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:daysOffset];
    
    // create a calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    NSLog(@"Yesterday: %@", date);
    return date;
}

@end

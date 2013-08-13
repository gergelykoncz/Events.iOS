//
//  EventListViewController.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventRepository.h"
#import "MADayView.h"
#import "MAEventMapper.h"
#import "NSDate+DateCategory.h"

@interface EventListViewController : UIViewController<EventsDelegate, MADayViewDataSource, MADayViewDelegate>{
    NSArray* eventList;
    EventRepository* repository;
    NSDate* actualDate;
}

@property(nonatomic, retain) IBOutlet MADayView* maDayView;

@end

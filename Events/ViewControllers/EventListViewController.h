//
//  EventListViewController.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventRepository.h"

@interface EventListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, EventsDelegate>{
    NSArray* eventList;
}

@property(nonatomic, retain) IBOutlet UITableView* eventsTable;

@end

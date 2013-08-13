//
//  EventListViewController.m
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "EventListViewController.h"

@interface EventListViewController ()

@end

@implementation EventListViewController
@synthesize maDayView;

-(id)init{
    self = [super init];
    if(self){
        repository = [[EventRepository alloc] init];
        actualDate = [NSDate date];
    }
    return self;
}

- (void)viewDidLoad{
    [self loadDataForActualDate];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView delegate

- (NSArray *)dayView:(MADayView *)dayView eventsForDate:(NSDate *)startDate{
    NSMutableArray* result = [NSMutableArray array];
    
    MAEventMapper* mapper = [[MAEventMapper alloc] init];
    for(Event* event in eventList){
        MAEvent* maEvent = [mapper map:event];
        NSLog(@"%@", maEvent.title);
        [result addObject:maEvent];
    }
    
    return result;
}
#pragma mark Events delegate

-(void)loadedEvents:(NSArray *)events{
    eventList = [NSArray arrayWithArray:events];
    maDayView.day = actualDate;
    [maDayView reloadData];
}

-(void)errorOccurred:(NSString *)message{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)nextDate{
    actualDate = [actualDate tomorrow];
    [self loadDataForActualDate];
}

-(void)previousDate{
    actualDate = [actualDate yesterday];
    [self loadDataForActualDate];
}

-(void)loadDataForActualDate{
    [repository loadEventsForDate:actualDate forDelegate:self];
}

@end

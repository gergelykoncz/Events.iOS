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
@synthesize eventsTable;

- (void)viewDidLoad{
    EventRepository* repository = [[EventRepository alloc] init];
    [repository loadEventsForDate:[NSDate date] forDelegate:self];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

#pragma mark UITableView delegate

-(int)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(eventList == nil){
        return 1;
    }
    else{
        return [eventList count];
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"CellIdentifier";
    if(eventList == nil){
        UITableViewCell* cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.textLabel setText:@"Loading..."];
        return cell;
    }
    else{
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        Event* event = [eventList objectAtIndex:indexPath.row];
        [cell.textLabel setText:event.Summary];
        return cell;
    }
}

#pragma mark Events delegate

-(void)loadedEvents:(NSArray *)events{
    eventList = [NSArray arrayWithArray:events];
    [self.eventsTable reloadData];
}

-(void)errorOccurred:(NSString *)message{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

@end

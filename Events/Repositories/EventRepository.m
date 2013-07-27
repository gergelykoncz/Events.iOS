//
//  EventRepository.m
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import "EventRepository.h"

@implementation EventRepository
@synthesize eventsDelegate;

-(void)loadEventsForDate:(NSDate *)date forDelegate:(NSObject<EventsDelegate> *)delegate{
    //Build and start an asynchronous request for event data.
    self.eventsDelegate = delegate;
    NSURL* url = [NSURL URLWithString:@"http://myserver.com/events.json"];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLConnection* connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    //Simply pass the error forward to the caller.
    [eventsDelegate errorOccurred:[error localizedDescription]];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    //Response arrived, initate the data buffer.
    requestData = [[NSMutableData alloc] init];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    //Append the arrived data chunk to the buffer.
    [requestData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    //Full response is here, parse the data as JSON.
    NSError* jsonParsingError;
    NSArray* jsonArray = [NSJSONSerialization
                     JSONObjectWithData:requestData
                     options:kNilOptions
                     error:&jsonParsingError];
    if(jsonParsingError){
        //Data is not JSON, notify caller.
        [eventsDelegate errorOccurred:@"Response is not JSON data."];
    }
    else{
        //Data is JSON, create Event elements from the entries.
        EventMapper* mapper = [[EventMapper alloc] init];
        NSMutableArray* result = [NSMutableArray arrayWithCapacity:[jsonArray count]];
        for(NSDictionary* dictionary in jsonArray){
            Event* event = [mapper mapDictionary:dictionary];
            [result addObject:event];
        }
        //Notify the delegate and pass the results.
        [eventsDelegate loadedEvents:result];
    }
}

@end

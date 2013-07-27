//
//  Event.h
//  Events
//
//  Created by Gergely Koncz on 7/27/13.
//  Copyright (c) 2013 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property(nonatomic, assign) BOOL AllDay;
@property(nonatomic, retain) NSString* Description;
@property(nonatomic, retain) NSDate* End;
@property(nonatomic, retain) NSDate* Start;
@property(nonatomic, retain) NSString* Summary;
@property(nonatomic, retain) NSString* UID;

@end

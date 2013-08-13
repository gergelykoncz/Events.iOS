//
//  MAEventMapper.h
//  OfficeGuru
//
//  Created by Gergely Koncz on 11/24/12.
//  Copyright (c) 2012 Gergely Koncz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MAEvent.h"
#import "Appointment.h"

@interface MAEventMapper : NSObject

-(MAEvent*) mapEvent:(Appointment*)appointment;

@end

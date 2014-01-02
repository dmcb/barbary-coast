//
//  GameConfig.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "GameConfig.h"

static GameConfig *sharedConfig = nil;

@implementation GameConfig

@synthesize saveSpot, birthDate, currentDate;


+ (id) sharedConfig {
    if (sharedConfig == nil)
    {
        sharedConfig = [[self alloc] init];
    }
    return sharedConfig;
}

- (id)init
{
    saveSpot = 0;
    
    if((self = [super init]))
    {
        NSDateComponents* comps = [[NSDateComponents alloc] init];
        [comps setDay:1];
        [comps setMonth:1];
        [comps setYear:1472];
        birthDate = [comps date];
        NSCalendar* gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        birthDate = [gregorian dateFromComponents:comps];
        
        [comps setDay:1];
        [comps setMonth:1];
        [comps setYear:1492];
        currentDate = [comps date];
        currentDate = [gregorian dateFromComponents:comps];
        
    }
    return self;
}

@end

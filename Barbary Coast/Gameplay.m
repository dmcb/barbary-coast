//
//  Gameplay.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "Gameplay.h"
#import "OceanLayer.h"
#import "HudLayer.h"

@implementation Gameplay

-(id) init
{
	if( (self=[super init]))
    {
        OceanLayer* oceanLayer = [OceanLayer node];
        [self addChild:oceanLayer z:1];
        
        HudLayer* hudLayer = [HudLayer node];
        [self addChild:hudLayer z:2];
    }
    
	return self;
}

@end

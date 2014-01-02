//
//  OceanLayer.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "OceanLayer.h"


@implementation OceanLayer

-(id) init
{
	if ((self = [super init]))
	{
        self.isTouchEnabled = YES;
        
        ship = [Player shipWithParentNode:self];
    }
    
    [self scheduleUpdate];
    
    return self;
}


-(void) update:(ccTime)delta
{
    //[self setViewpointCenter:ship.ship.position];
}

-(void)setViewpointCenter:(CGPoint) position {
    
    NSLog(@"Position: %fl, %fl", position.x, position.y);
    
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    //int x = MAX(position.x, winSize.width / 2);
    //int y = MAX(position.y, winSize.height / 2);
    //x = MIN(x, (_tileMap.mapSize.width * _tileMap.tileSize.width) - winSize.width / 2);
    //y = MIN(y, (_tileMap.mapSize.height * _tileMap.tileSize.height) - winSize.height/2);
    //CGPoint actualPosition = ccp(x, y);
    
    CGPoint actualPosition = position;
    
    CGPoint centerOfView = ccp(winSize.width/2, winSize.height/2);
    CGPoint viewPoint = ccpSub(centerOfView, actualPosition);
    
    self.position = viewPoint;
}

@end

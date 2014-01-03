//
//  Player.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "Player.h"


@implementation Player

@synthesize ship;

// Static autorelease initializer, mimics cocos2d's memory allocation scheme.
+(id) shipWithParentNode:(CCNode*)parentNode
{
	return [[self alloc] initWithParentNode:parentNode];
}

-(id) initWithParentNode:(CCNode*)parentNode
{
	if ((self = [super init]))
	{
        [parentNode addChild:self];
        
        // Get dimensions
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        // Create ship
        ship = [CCSprite spriteWithFile: @"ship-red.png"];
        ship.position = CGPointMake(screenSize.width*0.5, screenSize.height*0.5);
        ship.anchorPoint = CGPointMake(1, 0.5);
        [self addChild:ship];
        
        // Define velocity and agility
        shipAgility = 0.04;
        shipTopSpeed = 100;
        shipAcceleration = 2;
        
        // Define starting rotation
        ship.rotation = 270;
        
        // Add wake effects
        wake = [CCMotionStreak streakWithFade:5 minSeg:1 width:72 color:ccc3(255, 255, 255) textureFilename:@"Icon-72.png"];
        [self addChild:wake];
        
        [self scheduleUpdate];
        
		// Manually add this class as receiver of targeted touch events.
		[[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:-1 swallowsTouches:YES];
    }
    
    return self;
}

-(void) update:(ccTime)delta
{
    // Point the ship to wherever the direction indicated by the last touch
    float shortestAngle = -1 * shipDirection - ship.rotation;
    if (shortestAngle > 180)
    {
        shortestAngle -= 360;
    }
    if (shortestAngle < -180)
    {
        shortestAngle += 360;
    }

    ship.rotation += shortestAngle * shipAgility * shipSpeed*0.01;
    if (ship.rotation > 180)
    {
        ship.rotation -= 360;
    }
    if (ship.rotation < -180)
    {
        ship.rotation += 360;
    }
    
    // Ease the ship into it's indended speed
    if (shipTargetSpeed > shipSpeed)
    {
        shipSpeed = shipSpeed + (delta * ((shipTargetSpeed - shipSpeed) * shipAcceleration));
    }
    else if (shipTargetSpeed < shipSpeed)
    {
        shipSpeed = shipSpeed - (delta * ((shipTargetSpeed + shipSpeed) * shipAcceleration));
    }
    
    // Move the ship
    [ship setPosition:CGPointMake(ship.position.x - cos(CC_DEGREES_TO_RADIANS(ship.rotation))*delta*shipSpeed, ship.position.y + sin(CC_DEGREES_TO_RADIANS(ship.rotation))*delta*shipSpeed)];
    
    // Render the wake
//    [wake.ribbon addPointAt:(CGPointMake(ship.position.x, ship.position.y)) width:72];
	[wake update:delta];
    
    // Log
    NSLog(@"Speed: %fl. Target speed: %fl", shipSpeed, shipTargetSpeed);
    NSLog(@"Adding wake point at: %fl, %fl", ship.position.x, ship.position.y);
}

-(void) registerWithTouchDispatcher
{
    [[CCDirector sharedDirector].touchDispatcher addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    CGPoint touchPoint = [self convertTouchToNodeSpace: touch];
    
    if (ccpDistance(touchPoint, ship.position) < [ship texture].contentSize.width)
    {
        // User touched the ship, don't rotate it, but bring ship to slowest speed
        float desiredSpeed = sqrt(pow([ship texture].contentSize.width*0.5, 2) + pow([ship texture].contentSize.width*0.5, 2));
        shipTargetSpeed = desiredSpeed/(screenSize.width*0.4) * shipTopSpeed;
    }
    else
    {
        // Set the intended ship direction
        shipDirection = CC_RADIANS_TO_DEGREES(atan2(ship.position.y - touchPoint.y, ship.position.x - touchPoint.x));
        
        // Set the ships speed based off it's abilities and the distance touched away from the ship
        float desiredSpeed = sqrt((touchPoint.x - ship.position.x)*(touchPoint.x - ship.position.x) + (touchPoint.y - ship.position.y)*(touchPoint.y - ship.position.y));
        desiredSpeed = desiredSpeed/(screenSize.width*0.4);
        if (desiredSpeed > 1)
        {
            desiredSpeed = 1;
        }
        shipTargetSpeed = desiredSpeed * shipTopSpeed;
    }
    return true;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    CGPoint touchPoint = [self convertTouchToNodeSpace: touch];
    
    if (ccpDistance(touchPoint, ship.position) < [ship texture].contentSize.width)
    {
        // User touched the ship, don't rotate it, but bring ship to slowest speed
        float desiredSpeed = sqrt(pow([ship texture].contentSize.width*0.5, 2) + pow([ship texture].contentSize.width*0.5, 2));
        shipTargetSpeed = desiredSpeed/(screenSize.width*0.4) * shipTopSpeed;
    }
    else
    {
        // Set the intended ship direction
        shipDirection = CC_RADIANS_TO_DEGREES(atan2(ship.position.y - touchPoint.y, ship.position.x - touchPoint.x));
        
        // Set the ships speed based off it's abilities and the distance touched away from the ship
        float desiredSpeed = sqrt((touchPoint.x - ship.position.x)*(touchPoint.x - ship.position.x) + (touchPoint.y - ship.position.y)*(touchPoint.y - ship.position.y));
        desiredSpeed = desiredSpeed/(screenSize.width*0.4);
        if (desiredSpeed > 1)
        {
            desiredSpeed = 1;
        }
        shipTargetSpeed = desiredSpeed * shipTopSpeed;
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

@end

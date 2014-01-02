//
//  Player.h
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Player : CCNode
{
    CCSprite* ship;
    CCMotionStreak* wake;
    float shipAgility;
    float shipDirection;
    float shipSpeed;
    float shipTargetSpeed;
    float shipTopSpeed;
    float shipAcceleration;
}

@property (nonatomic, retain) CCSprite* ship;

+(id) shipWithParentNode:(CCNode*)parentNode;
-(id) initWithParentNode:(CCNode*)parentNode;

@end

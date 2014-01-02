//
//  OceanLayer.h
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Player.h"

@interface OceanLayer : CCLayer
{
    Player* ship;
}

-(void) setViewpointCenter:(CGPoint)position;


@end

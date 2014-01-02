//
//  GameConfig.h
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameConfig : NSObject {
    NSInteger saveSpot;
    
    NSDate* birthDate;
    NSDate* currentDate;
}

@property (nonatomic) NSInteger saveSpot;
@property (nonatomic, retain) NSDate* birthDate;
@property (nonatomic, retain) NSDate* currentDate;

+(id) sharedConfig;

@end

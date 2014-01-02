//
//  HudLayer.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "HudLayer.h"
#import "GameConfig.h"


@implementation HudLayer

-(id) init
{
	if ((self = [super init]))
	{
        /*
         CCSprite* hud;
         hud = [CCSprite spriteWithFile: @"interface-widescreen.png"];
         hud.anchorPoint = CGPointMake(0,0);
         [self addChild:hud];
         */
        
        // Get dimensions
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        // Set date label
        dateLabel = [CCLabelBMFont labelWithString:@"" fntFile:@"AquilineTwo.fnt"];
        dateLabel.position = CGPointMake(screenSize.width*0.5, screenSize.height);
        
        // Adjust the label's anchorPoint's y position to make it align with the top.
        dateLabel.anchorPoint = CGPointMake(0.5f, 1.0f);
        dateFormat = [[NSDateFormatter alloc] init];
		[dateFormat setDateFormat:@"MMMM dd, y"];
        
        // Add the date label
        [self addChild:dateLabel];
        
        [self scheduleUpdate];
        
        return self;
    }
}
    
-(void) update:(ccTime)delta
{
    {
        //NSLog(@"doStep: %fl",delta);
        GameConfig* sharedConfig = [GameConfig sharedConfig];
        sharedConfig.currentDate = [sharedConfig.currentDate dateByAddingTimeInterval:delta*30000];
        dateString = [dateFormat stringFromDate:sharedConfig.currentDate];
        [dateLabel setString:dateString];
    }
}

@end

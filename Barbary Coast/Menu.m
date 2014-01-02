//
//  Menu.m
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import "Menu.h"
#import "Gameplay.h"


@implementation Menu

+(id) scene {
    CCScene *scene = [CCScene node];
    Menu *layer = [Menu node];
    [scene addChild: layer];
    return scene;
}

-(id) init
{
	if( (self=[super init]))
    {
        
        // Get dimensions
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        // Set background
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"menu.png"];
        [texture setAliasTexParameters];
        CCSprite *background = [CCSprite spriteWithTexture:texture];
        background.position = ccp(screenSize.width*0.5, screenSize.height*0.5);
        [self addChild:background];
        
        // Create main menu
        [CCMenuItemFont setFontName:@"AquilineTwo"];
        [CCMenuItemFont setFontSize:48];
        CCMenuItem *New = [CCMenuItemFont itemWithString:@"New Game"
                                                  target:self
                                                selector:@selector(goToGameplay:)
                           ];
        CCMenuItem *Resume = [CCMenuItemFont itemWithString:@"Resume Game"
                                                     target:self
                                                   selector:@selector(goToGameplay:)
                              ];
        CCMenuItem *Options = [CCMenuItemFont itemWithString:@"Options"
                                                      target:self
                                                    selector:@selector(goToGameplay:)
                               ];
        New.color = ccc3(109, 40, 0);
        Resume.color = ccc3(109, 40, 0);
        Options.color = ccc3(109, 40, 0);
        CCMenu *menu = [CCMenu menuWithItems: New, Resume, Options, nil];
        [menu alignItemsVerticallyWithPadding:10];
        menu.position = ccp(screenSize.width*0.5, screenSize.height*0.5-80);
        [self addChild:menu];
    }
    
    return self;
}

-(void) goToGameplay: (id) sender
{
    [[CCDirector sharedDirector]
     replaceScene:[CCTransitionFade
                   transitionWithDuration:0.5
                   scene:[Gameplay node]
                   ]];
}

@end
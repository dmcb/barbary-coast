//
//  HudLayer.h
//  Barbary Coast
//
//  Created by Derek McBurney on 12/31/2013.
//  Copyright 2013 Derek McBurney. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HudLayer : CCLayer {
    CCLabelBMFont* dateLabel;
    NSDateFormatter* dateFormat;
    NSString* dateString;
}

-(void) update:(ccTime)delta;

@end

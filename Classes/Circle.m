//
//  Circle.m
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Circle.h"


@implementation Circle
@synthesize radius, NumberOfPlayers, x, y, xVelocity, yVelocity;

-(void) setup {
	NumberOfPlayers = 1;
	radius = 100.0f;
	x = 160;
	y = 240;
	xVelocity = 3.0f;
	yVelocity = 3.0f;
}

@end

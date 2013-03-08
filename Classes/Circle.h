//
//  Circle.h
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Circle : NSObject {
	CGFloat radius;
	int NumberOfPlayers;
	int x;
	int y;
	double xVelocity;
	double yVelocity;
}

@property(nonatomic) CGFloat radius;
@property(nonatomic) int NumberOfPlayers;
@property(nonatomic) int x;
@property(nonatomic) int y;
@property(nonatomic) double xVelocity;
@property(nonatomic) double yVelocity;
-(void)setup;
@end

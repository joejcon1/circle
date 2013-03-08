//
//  CircleViewController.h
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Circle.h"

@interface CircleViewController : UIViewController {
	Circle *circle;
	Circle *ball;
	NSMutableArray *touchesArray;
	Boolean gameStarted;
	CADisplayLink *theTimer;
}

@property(nonatomic, retain) Circle *circle;
@property(nonatomic, retain) Circle *ball;
@property(nonatomic) Boolean gameStarted;
@property(nonatomic, retain) NSMutableArray *touchesArray;

-(void)startGame ;

@end


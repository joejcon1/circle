//
//  GameCanvas.m
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GameCanvas.h"

#define screenwidth 320
#define screenheight 480


@implementation GameCanvas
@synthesize currentVC;

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	//draw Ball
	CGContextSetRGBStrokeColor(c, 0.8, 0, 0, 0.5);
	CGContextSetRGBFillColor(c, 0.8, 0, 0, 0.5);
	CGContextStrokeEllipseInRect(c, CGRectMake(currentVC.ball.x, currentVC.ball.y, currentVC.ball.radius*2, currentVC.ball.radius*2));
	CGContextFillEllipseInRect(c, CGRectMake(currentVC.ball.x, currentVC.ball.y, currentVC.ball.radius*2, currentVC.ball.radius*2));
	
	
	CGContextSetRGBStrokeColor(c, 0, 0, 0, 0.5);
	
	CGFloat radius = currentVC.circle.radius;
	int x = (screenwidth / 2) - radius;
	int y = (screenheight / 2) - radius;
	CGPoint centre = CGPointMake(screenwidth/2,screenheight/2);

	CGContextStrokeEllipseInRect(c, CGRectMake(x, y, 2*radius, 2*radius));
	
	CGContextSetRGBStrokeColor(c, 1, 1, 1, 1);
	
	//mark touch on circle
	
	/*
	CGContextBeginPath(c);
	CGContextSetRGBStrokeColor(c, 1, 0, 0, 1);
	CGContextStrokeRect(c, CGRectMake(centre.x, centre.y, 3, 3));
	CGContextStrokePath(c);
	*/
	
	for (NSValue *v in currentVC.touchesArray) {
		
		CGPoint location = [v CGPointValue];
		
		double dist = sqrt((centre.x - location.x)*(centre.x - location.x) + (centre.y - location.y)*(centre.y - location.y));
		if (dist < radius) {
			break;
		}
		
		
		
		double vX = location.x - centre.x;
		double vY = location.y - centre.y;
		double magV = sqrt(vX*vX + vY*vY);
		double offsetX = vX / magV * radius;
		double offsetY = vY / magV * radius;
		double aX = centre.x + offsetX;
		//double aY = centre.y + offsetY;
		
		
		//arc = sqrt((aX*aX)+(aY*aY))
		
		CGContextBeginPath(c);
		CGContextSetCMYKFillColor(c, 0, 0, 1, 0, 0.6);
		CGContextSetCMYKStrokeColor(c, 0, 0, 1, 0, 0.6);
		//CGContextStrokeRect(c, CGRectMake(aX-1, aY-1, 3, 3));
		//CGContextFillRect(c, CGRectMake(aX-1, aY-1, 3, 3));
		CGContextStrokePath(c);
			
		double u = asin((aX-centre.x)/radius);
		double Px = centre.x + radius * sin(u);
		double theta = (double)20 / radius;
		
		double Py;
		double P1y;
		double P2y;
		
		if (location.y > (screenheight/2)) {
			Py = centre.y + radius * cos(u);
			P1y = centre.y + radius * cos(u + theta/2);
			P2y = centre.y + radius * cos(u - theta/2);
		}
		else {
			Py = centre.y - radius * cos(u);
			P1y = centre.y - radius * cos(u + theta/2);
			P2y = centre.y - radius * cos(u - theta/2);
		}

		
		
		
		double P1x = centre.x + radius * sin(u + theta/2);
		
		
		double P2x = centre.x + radius * sin(u - theta/2);
		
		
		CGContextBeginPath(c);
		CGContextSetRGBStrokeColor(c, 1, 0, 0, 0.6);
		CGContextSetLineWidth(c, 3);
		
		CGContextMoveToPoint(c, P1x, P1y);
		CGContextAddCurveToPoint(c, P1x, P1y, Px, Py, P2x, P2y);

		CGContextStrokePath(c);

		CGRect paddle = CGRectMake(P1x, P1y, P2x-P1x, P2y-P1y);
		CGRect ball = CGRectMake(currentVC.ball.x, currentVC.ball.y, currentVC.ball.radius*2+1, currentVC.ball.radius*2+1);
		
		double ballCentreX = currentVC.ball.x + currentVC.ball.radius;
		double ballCentreY = currentVC.ball.y + currentVC.ball.radius;
		
		
		
		double dist2 = sqrt((centre.x - ballCentreX)*(centre.x - ballCentreX) + (centre.y - ballCentreY)*(centre.y - ballCentreY));
		if (dist2 > radius) {
			if (CGRectIntersectsRect(ball, paddle)) {
				currentVC.ball.yVelocity = - currentVC.ball.yVelocity;
				currentVC.ball.xVelocity = - currentVC.ball.xVelocity;
			}
			else {
				currentVC.ball.xVelocity = 0;
				currentVC.ball.yVelocity = 0;
				self.backgroundColor = [UIColor blackColor];
				currentVC.gameStarted = NO;
			}
            
		}
		
		
	}
		

	
	
    
}


- (void)dealloc {
    [super dealloc];
}


@end

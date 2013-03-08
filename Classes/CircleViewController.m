//
//  CircleViewController.m
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 RGB Studio. All rights reserved.
//

#import "CircleViewController.h"



@implementation CircleViewController
@synthesize circle, touchesArray, ball, gameStarted;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"%d in touches", touches.count);
	[touchesArray removeAllObjects];
	int i=0;
	for (UITouch *t in touches) {
		
		CGPoint location = [t locationInView:[self view]];
		if ([touchesArray count]>=[touches count]) {
			[touchesArray replaceObjectAtIndex:i withObject:[NSValue valueWithCGPoint:location]];
		}
		else {
			[touchesArray insertObject:[NSValue valueWithCGPoint:location] atIndex:i];
		}
		
		i++;
		
	}
	if (!gameStarted) {
		gameStarted = YES;
		[self startGame];
	}
	[[self view] setNeedsDisplay];
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"%d in touches", touches.count);
	[touchesArray removeAllObjects];
	int i=0;
	for (UITouch *t in touches) {
		
		CGPoint location = [t locationInView:[self view]];
		if ([touchesArray count]>=[touches count]) {
			[touchesArray replaceObjectAtIndex:i withObject:[NSValue valueWithCGPoint:location]];
		}
		else {
			[touchesArray insertObject:[NSValue valueWithCGPoint:location] atIndex:i];
		}
		
		i++;
		
	}
	[[self view] setNeedsDisplay];
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	//NSLog(@"%d in touches", touches.count);
	int i=0;
	for (UITouch *t in touches) {
		
		CGPoint location = [t locationInView:[self view]];
		if ([touchesArray count]>=[touches count]) {
			[touchesArray replaceObjectAtIndex:i withObject:[NSValue valueWithCGPoint:location]];
		}
		else {
			[touchesArray insertObject:[NSValue valueWithCGPoint:location] atIndex:i];
		}
		
		i++;
		
	}
	[[self view] setNeedsDisplay];
	
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/
- (void) nextFrame {
    ball.x += ball.xVelocity;
	ball.y += ball.yVelocity;
	//[[self view] setNeedsDisplayInRect:CGRectMake(ball.x-ball.xVelocity-1, ball.y-ball.yVelocity-1, ball.radius*2+ball.xVelocity+4, ball.radius*2+ball.yVelocity+4)];
	[[self view] setNeedsDisplay];
}
-(void)initialiseTimer {
	if(theTimer==nil){
		theTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(nextFrame)];
		theTimer.frameInterval = 2;
		[theTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode: NSDefaultRunLoopMode];
	}
}

-(void)startGame {
	ball = [[Circle alloc] init];
	ball.radius = 2;
	ball.x = 160;
	ball.y = 240;
	ball.xVelocity = 1;
	ball.yVelocity = 1;
	[self initialiseTimer];
	[self view].backgroundColor = [UIColor whiteColor];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	circle = [[Circle alloc] init];
	[circle setup];
	touchesArray = [[NSMutableArray alloc] init];
	[[self view] setNeedsDisplay];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[circle release];
}

@end

//
//  GameCanvas.h
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleViewController.h"

@interface GameCanvas : UIView {
	CircleViewController *currentVC;
	UITouch *player1;
	UITouch *player2;
}

@property(nonatomic,retain) IBOutlet CircleViewController *currentVC;
@end

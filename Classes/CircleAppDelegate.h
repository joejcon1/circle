//
//  CircleAppDelegate.h
//  Circle
//
//  Created by Joseph Conway on 03/11/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CircleViewController;

@interface CircleAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CircleViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CircleViewController *viewController;

@end


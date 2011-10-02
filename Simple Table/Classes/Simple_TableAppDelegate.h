//
//  Simple_TableAppDelegate.h
//  Simple Table
//
//  Created by xushiwei on 11-6-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Simple_TableViewController;

@interface Simple_TableAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Simple_TableViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Simple_TableViewController *viewController;

@end


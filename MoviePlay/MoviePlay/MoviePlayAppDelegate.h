//
//  MoviePlayAppDelegate.h
//  MoviePlay
//
//  Created by xushiwei on 11-9-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoviePlayViewController;

@interface MoviePlayAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MoviePlayViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MoviePlayViewController *viewController;
@end
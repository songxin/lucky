//
//  MoviePlaAppDelegate.h
//  MoviePla
//
//  Created by xushiwei on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MoviePlaViewController;

@interface MoviePlaAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MoviePlaViewController *viewController;
}
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MoviePlaViewController *viewController;
@end

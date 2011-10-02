//
//  MovieAppDelegate.h
//  Movie
//
//  Created by xushiwei on 11-7-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import ""

@interface MovieAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestViewController *vc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) TestViewController *vc;
@end

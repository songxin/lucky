//
//  ResizeWindowAppDelegate.h
//  ResizeWindow
//
//  Created by xushiwei on 11-10-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ResizeWindowAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;
@end

//
//  ResizeWindowAppDelegate.m
//  ResizeWindow
//
//  Created by xushiwei on 11-10-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ResizeWindowAppDelegate.h"

@implementation ResizeWindowAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSSize)windowWillResize:(NSWindow*)sender
                   toSize:(NSSize)framesize {

    NSLog(@"windowWillResize");
    NSSize mySize = framesize;
    mySize.width = mySize.height;
    return mySize;
}

@end
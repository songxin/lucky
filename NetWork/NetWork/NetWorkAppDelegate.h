//
//  NetWorkAppDelegate.h
//  NetWork
//
//  Created by xushiwei on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NetWorkAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSTextField *textFiled;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSTextField *textField;
@end
//
//  ListAppDelegate.h
//  List
//
//  Created by xushiwei on 11-10-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ListAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSTextField *textField;
    NSTableView *tableView;
    NSMutableArray *strList;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSTextField *textField;
@property (nonatomic, retain) IBOutlet NSTableView *tableView;
@property (nonatomic, retain) NSMutableArray *strList;

- (IBAction)addString:(id)sender;
@end
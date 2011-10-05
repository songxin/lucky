//
//  ListAppDelegate.m
//  List
//
//  Created by xushiwei on 11-10-2.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "ListAppDelegate.h"

@implementation ListAppDelegate

@synthesize window;
@synthesize textField;
@synthesize tableView;
@synthesize strList;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    strList = [[NSMutableArray alloc] init];
}

- (IBAction)addString:(id)sender {
    
    NSString *string = [textField stringValue];
    [strList addObject:string];
    NSLog(@"strList:%@",strList);
    NSLog(@"%d",(int)[strList count]);
    [tableView reloadData];
}

- (int)numberOfRowsInTableView:(NSTableView*)tv {
    
    NSLog(@"numberOfRowsInTableView");
    
    return (int)[strList count];
}

- (id)tableView:(NSTableView*)tv
objectValueForTableColumn:(NSTableColumn *)tableColumn
            row:(int)row {
    
    NSLog(@"tableView");
    
    return [strList objectAtIndex:row];
}


- (void)tableView:(NSTabView*)tv
   setObjectValue:(id)object
   forTableColumn:(NSTableColumn *)tableColumn
              row:(NSInteger)row {
    
    NSString *string = [tableView stringValue];
    [strList replaceObjectAtIndex:row withObject:string];
}

- (void)tableView:(NSTableView*)tv
sortDescriptorsDidChange:(NSArray *)oldDescriptors {
    NSArray *newDescriptors = [tableView sortDescriptors];
    [strList sortUsingDescriptors:newDescriptors];
    [tableView reloadData];
}
@end
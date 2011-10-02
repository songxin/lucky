//
//  NetWorkAppDelegate.m
//  NetWork
//
//  Created by xushiwei on 11-10-1.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "NetWorkAppDelegate.h"

@implementation NetWorkAppDelegate
@synthesize textField;
@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
//    NSError *error;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init]; 
    // 設置URL
    [request setURL:[NSURL URLWithString:@"http://www.baidu.com/"]]; 
    // 設置HTTP方法 
    [request setHTTPMethod:@"GET"];
    // 發送同步請求, 這裡得returnData就是返回得數據楽
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    // 釋放對象 
    NSString* aStr = [[NSString alloc] initWithData:returnData encoding:NSASCIIStringEncoding];
    
    [request release];
    NSLog(@"%@",aStr);
//    [textField setStringValue:aStr];
    [returnData writeToFile:@"/Users/xushiwei/1.htm" atomically:YES];
    [aStr release];

    // Insert code here to initialize your application
}
@end
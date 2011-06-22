    //
//  YellowViewController.m
//  View Switcher
//
//  Created by xushiwei on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "YellowViewController.h"


@implementation YellowViewController

- (IBAction)yellowButtonPressed {
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Blue View Button Pressed"
												   message:@"You pressed the button on the blue view"
												  delegate:nil
										 cancelButtonTitle:@"Yes, I did"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

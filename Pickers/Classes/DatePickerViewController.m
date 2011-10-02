//
//  DatePickerViewController.m
//  Pickers
//
//  Created by xushiwei on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DatePickerViewController.h"


@implementation DatePickerViewController
@synthesize datePicker;

- (IBAction)buttonPressed {
	NSDate *selected = [datePicker date];
	NSString *message = [[NSString alloc]initWithFormat:@"The date and time you selected is: %@", selected];
	
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Date and Time Selected"
												   message:message
												  delegate:nil
										 cancelButtonTitle:@"YES, I did"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
	[message release];

}

- (void)viewDidLoad {
	NSDate *now = [[NSDate alloc]init];
	[datePicker setDate:now animated:NO];
	[now release];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.datePicker = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[datePicker release];
    [super dealloc];
}


@end

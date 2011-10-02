//
//  SingleComponentPickerViewController.m
//  Pickers
//
//  Created by xushiwei on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SingleComponentPickerViewController.h"


@implementation SingleComponentPickerViewController
@synthesize singlePicker;
@synthesize pickerData;

- (IBAction)buttonPressed {
	NSInteger row = [singlePicker selectedRowInComponent:0];
	NSString *selected = [pickerData objectAtIndex:row];
	NSString *title = [[NSString alloc]initWithFormat:@"You select %@!", selected];
	
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title
												   message:@"Thank you for choosing."
												  delegate:nil
										 cancelButtonTitle:@"You're Welcome"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
	[title release];
	

}

- (void)viewDidLoad {
	NSArray *array = [[NSArray alloc]initWithObjects:@"Luke", @"Leia", @"Han", @"Chewbacca", @"Artoo", @"Threepio", @"Lando", nil];
	self.pickerData = array;
	[array release];
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	self.singlePicker = nil;
	self.pickerData = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[singlePicker release];
	[pickerData release];
    [super dealloc];
}


#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [pickerData count];
}

#pragma mark Picker Delegate Methods
- (NSString*)pickerView:(UIPickerView *)pickerView
			titleForRow:(NSInteger)row
		   forComponent:(NSInteger)component {

	return [pickerData objectAtIndex:row];
}

@end

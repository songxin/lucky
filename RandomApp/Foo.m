//
//  Foo.m
//  RandomApp
//
//  Created by xushiwei on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Foo.h"


@implementation Foo

- (void)awakeFromNib {
	NSCalendarDate *now;
	now = [NSCalendarDate calendarDate];
	[textField setObjectValue:now];
}
/*
- (IBAction)seed:(id)sender {
	srandom(time(NULL));
	[textField setStringValue:@"Generator seeded"];
}
*/
- (IBAction)generate:(id)sender {
	int generated;
	generated = (random() % 100) + 1;
	
	NSLog(@"generated = %d",generated);
	[textField setIntValue:generated];
}
	

@end

//
//  Edit.m
//  LineEdit
//
//  Created by xushiwei on 11-5-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Edit.h"


@implementation Edit

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		text = [[NSMutableString alloc] init];
		pos = pos0 = 0;
    }
    return self;
}

- (void)dealloc {
	[text release];
	[super dealloc];
}

- (void)drawRect:(NSRect)dirtyRect {
	NSMutableString* text1 = [[NSMutableString alloc] initWithString: text];
	if (pos == pos0) {
		[text1 insertString: @"|" atIndex: pos];
	}
	else { // []
		[text1 insertString: @"]" atIndex: MAX(pos, pos0)];
		[text1 insertString: @"[" atIndex: MIN(pos, pos0)];		
	}
	
    NSMutableDictionary* attributes = [[NSMutableDictionary alloc] init];
	[attributes setObject:[NSFont fontWithName:@"Helvetica" size:16] forKey:NSFontAttributeName];
	[attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
	
	NSRect r = [self bounds];
	NSSize sz = [text1 sizeWithAttributes: attributes];
	NSPoint point = {r.origin.x, r.origin.y + (r.size.height - sz.height)};
	[text1 drawAtPoint: point withAttributes: attributes];
}

//33336483
- (BOOL)acceptsFirstResponder {
	return YES;
}

/*
- (void)writeToPasteboard:(NSPasteboard*)pb
{
	[pb declareTypes:[NSArray arrayWithObject:NSStringPboardType] owner:self];
	
	[pb setString:text forType:NSStringPboardType];
}

- (BOOL)readFromPasteboard:(NSPasteboard*)pb
{
	NSArray *types = [pb types];
	if ([types containsObject:NSStringPboardType]) {
		
		NSString *value = [pb stringForType:NSStringPboardType];
		if ([value length]) {
			[self setString:value];
			return YES;
		}
	}
	return NO;
}

- (IBAction)cut:(id)sender {
	[self copy:sender];
	[self setString:@""];
}

- (IBAction)copy:(id)sender {
	NSPasteboard *pb = [NSPasteboard generalPasteboard];
	[self writeToPasteboard:pb];
}

- (IBAction)paste:(id)sender {
	NSPasteboard *pb = [NSPasteboard generalPasteboard];
	if (![self readFromPasteboard:pb]) {
		NSBeep();
	}
}
*/

- (IBAction)paste:(id)sender {
	NSLog(@"paste");
	NSPasteboard* pb = [NSPasteboard generalPasteboard];
/*	NSArray* types = [pb types];
	for (int i = 0; i < [types count]; ++i) {
		NSString* type = (NSString*)[types objectAtIndex: i];
		NSLog(@"%@", type);
	}
*/
	NSString* pbText = [pb stringForType: @"public.utf8-plain-text"];
	if ([pbText length] > 0) {
		[self insert: pbText];
	}
}

- (void)deleteRange {
	NSRange rg;
	rg.location = MIN(pos, pos0);
	rg.length = ABS(pos - pos0);
	[text deleteCharactersInRange:rg];
	pos = pos0 = rg.location;
}

- (void)insert:(NSString *)characters {
	if (pos != pos0) {
		[self deleteRange];
	}
	[text insertString: characters atIndex: pos];
	pos += [characters length];
	pos0 = pos;
	[self setNeedsDisplay:YES];
}

- (void)keyDown:(NSEvent *)event {
	NSLog(@"%@, %d", event.characters, event.keyCode);
	if (event.keyCode == 51) { // deleteBackward
		if (pos == pos0) {
			if (pos > 0) {
				NSRange rg;
				rg.location = pos - 1;
				rg.length = 1;
				[text deleteCharactersInRange:rg];
				--pos;
				pos0 = pos;
			}
		}
		else {
			[self deleteRange];
		}
	}
	else if (event.keyCode == 123 || event.keyCode == 126) { // left
		if (pos > 0)
			--pos;
		if (!(event.modifierFlags & NSShiftKeyMask)) {
			pos0 = pos;
		}
	}
	else if (event.keyCode == 124 || event.keyCode == 125) { // right
		if (pos < [text length])
			++pos;
		if (!(event.modifierFlags & NSShiftKeyMask)) {
			pos0 = pos;
		}
	}
	else {
		[self insert: event.characters];
	}
	[self setNeedsDisplay:YES];
}

@end

//
//  Edit.m
//  TextEdit
//
//  Created by xushiwei on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Edit.h"


@implementation Edit

- (id)initWithFrame:(NSRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
		text =[[NSMutableString alloc] init];
		pos = pos0 = 0;
    }
    return self;
}

- (void)dealloc {
	[text release];
	[super dealloc];
}


- (void)drawRect:(NSRect)dirtyRect {
	NSMutableString *text1 = [[NSMutableString alloc] initWithString:text];
	if (pos == pos0) {
		[text1 insertString:@"|" atIndex:pos];
	}
	else {
		[text1 insertString:@")" atIndex:MAX(pos,pos0)];
		[text1 insertString:@"(" atIndex:MIN(pos,pos0)];
	}
	
	
	NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
	[attributes setObject:[NSFont fontWithName:@"Helvetica" size:16] forKey:NSFontAttributeName];
	[attributes setObject:[NSColor redColor] forKey:NSForegroundColorAttributeName];
	
	NSSize si = [text1 sizeWithAttributes:attributes];
	NSRect r = [self bounds];
	NSPoint point;
	point.x = r.origin.x;
	point.y = r.origin.y + (r.size.height - si.height);
	//[text1 drawAtPoint:point withAttributes:attributes];
	
	NSMutableAttributedString *s;
	s = [[NSMutableAttributedString alloc] initWithString:text1];
	[s addAttribute:NSFontAttributeName
			  value:[NSFont userFontOfSize:16]
			  range:NSMakeRange(0, [s length])];
	/*
	[s addAttribute:NSForegroundColorAttributeName
				  value:[NSColor redColor]
				  range:NSMakeRange(0,[s length])];
	*/
	[s addAttribute:NSForegroundColorAttributeName
			  value:[NSColor redColor]
			  range:NSMakeRange(MIN(pos,pos0) + 1,ABS(pos - pos0))];
	
	[s drawAtPoint:point];

}

- (IBAction)paste:(id)sender {
	NSLog(@"paste");
	NSPasteboard *pb = [NSPasteboard generalPasteboard];
	NSArray *types = [pb types];
	for (int i = 0; i < [types count]; ++i) {
		NSString* type = (NSString*)[types objectAtIndex: i];
		NSLog(@"%@", type);
	}
	
	NSString *pbString = [pb stringForType:@"public.utf8-plain-text"];
	if ([pbString length] > 0) {
		/*
		if (pos != pos0) {
			NSRange rg;
			rg.location = MIN(pos,pos0);
			rg.length = ABS(pos - pos0);
			[text deleteCharactersInRange:rg];
			pos = rg.location;
			pos0 = pos;
			[text insertString:pbString atIndex:pos];
			pos += [pbString length];
			pos0 = pos;
			[self setNeedsDisplay:YES];
		}
		else {
			[text insertString:pbString atIndex:pos];
			pos += [pbString length];
			pos0 = pos;
			[self setNeedsDisplay:YES];
		}
		 */
		[self insert:pbString];
		//[self setNeedsDisplay:YES];
	}
	
}
- (IBAction)copy:(id)sender {
	NSLog(@"copy");
	
	if (pos != pos0) {
		if (pos > 0) {
			NSPasteboard *pb = [NSPasteboard generalPasteboard];
			[pb declareTypes:[NSArray arrayWithObject:@"public.utf8-plain-text"] owner:self];
			
			NSString *rgString = [text substringWithRange:NSMakeRange(MIN(pos,pos0), ABS(pos - pos0))];
			[pb setString:rgString forType:@"public.utf8-plain-text"];
		}
	}
}

- (IBAction)cut:(id)sender {
	NSLog(@"cut");
	if (pos != pos0) {
		if (pos > 0) {
			NSPasteboard *pb = [NSPasteboard generalPasteboard];
			[pb declareTypes:[NSArray arrayWithObject:@"public.utf8-plain-text"] owner:self];
			
			NSString *rgString = [text substringWithRange:NSMakeRange(MIN(pos,pos0), ABS(pos - pos0))];
			[pb setString:rgString forType:@"public.utf8-plain-text"];
			
			[self deleteRange];
		}
		[self setNeedsDisplay:YES];
	}
}

- (void)deleteRange {
	NSRange rg;
	rg.location = MIN(pos,pos0);
	rg.length = ABS(pos - pos0);
	[text deleteCharactersInRange:rg];
	pos0 = pos = rg.location;
}

- (void)insert:(NSString*)string
{
	if (pos != pos0) {
		[self deleteRange];
	}
	[text insertString: string atIndex: pos];
	pos += [string length];
	pos0 = pos;
	[self setNeedsDisplay:YES];

}

- (BOOL)acceptsFirstResponder {
	return YES;
}

- (void)keyDown:(NSEvent *)event {
	
	NSLog(@"%@, %d",event.characters, event.keyCode);

	if (event.keyCode == 51) {
		if (pos == pos0) {
			if (pos > 0) {
				NSRange r;
				r.location = pos - 1;
				r.length = 1;
				[text deleteCharactersInRange:r];
				--pos;
				pos0 = pos;
			}
		}
		else {
			/*
			NSRange rg;
			rg.location = MIN(pos,pos0);
			rg.length = ABS(pos - pos0);
			[text deleteCharactersInRange:rg];
			pos0 = pos = rg.location;
			 */
			[self deleteRange];
		}
		NSLog(@"%@",text);
	}    
	else if (event.keyCode == 123 || event.keyCode == 125) {
		if (pos > 0)
			--pos;
		if (!(event.modifierFlags & NSShiftKeyMask)) {
			pos0 = pos;
		}
	}
	else if (event.keyCode == 124 || event.keyCode == 126) {
		if (pos < [text length])
			++pos;
		if (!(event.modifierFlags & NSShiftKeyMask)) {
			pos0 = pos;
		}
	}
	else {
		/*
		 if (pos != pos0) {
			
			NSRange rg;
			rg.location = MIN(pos,pos0);
			rg.length = ABS(pos - pos0);
			[text deleteCharactersInRange:rg];
			pos0 = pos = rg.location;
			
			[text insertString:event.characters atIndex:pos];
			pos += [event.characters length];
			pos0 = pos;
			 
		}
		else {
			[text insertString:event.characters atIndex:pos];
			NSLog(@"%@",text);
			pos += [event.characters length];
			pos0 = pos;
		}
		*/
		[self insert:event.characters];
	}
	[self setNeedsDisplay:YES];
}
@end
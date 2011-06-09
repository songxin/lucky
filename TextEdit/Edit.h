//
//  Edit.h
//  TextEdit
//
//  Created by xushiwei on 11-5-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Edit : NSView {
	NSMutableString *text;
	int pos;
	int pos0;

}
- (void)insert:(NSString*)string;
- (void)deleteRange;
@end

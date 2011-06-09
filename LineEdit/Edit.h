//
//  Edit.h
//  LineEdit
//
//  Created by xushiwei on 11-5-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Edit : NSView {
	NSMutableString* text;
	int pos;
	int pos0; // 基点
}

- (void)insert:(NSString *)characters;
- (void)deleteRange;

@end

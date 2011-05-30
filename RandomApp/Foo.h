//
//  Foo.h
//  RandomApp
//
//  Created by xushiwei on 5/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Foo : NSObject {
	IBOutlet NSTextField *textField;

}
- (IBAction)seed:(id)sender;
- (IBAction)generate:(id)sender;
@end

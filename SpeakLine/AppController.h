//
//  AppController.h
//  SpeakLine
//
//  Created by xushiwei on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
	IBOutlet NSTextField *textField;
	NSSpeechSynthesizer *speechSynth;
	
	IBOutlet NSButton *stopButton;
	IBOutlet NSButton *startButton;

}
- (IBAction)say:(id)sender;
- (IBAction)stop:(id)sender;
- (void)speechSynthesizer:(NSSpeechSynthesizer*)sender 
		didFinishSpeaking:(BOOL)finishedSpeaking;

@end

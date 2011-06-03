//
//  AppController.m
//  SpeakLine
//
//  Created by xushiwei on 5/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (id)init {
	[super init];
	
	speechSynth = [[NSSpeechSynthesizer alloc] initWithVoice:nil];
	[speechSynth setDelegate:self];
	return self;
}

- (void)speechSynthesizer:(NSSpeechSynthesizer*)sender 
		didFinishSpeaking:(BOOL)finishedSpeaking {
	[stopButton setEnabled:NO];
	[startButton setEnabled:YES];
	
}

- (IBAction)say:(id)sender {
	NSString *string = [textField stringValue];
	
	[speechSynth startSpeakingString:string];
	[stopButton setEnabled:YES];
	[startButton setEnabled:NO];
}

- (IBAction)stop:(id)sender {
	[speechSynth stopSpeaking];
}
@end

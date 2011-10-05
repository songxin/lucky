//
//  Person.m
//  RaiseMan
//
//  Created by xushiwei on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person
@synthesize personName;
@synthesize expectedRaise;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        expectedRaise = 0.0;
        personName = @"New Person";
    }
    
    return self;
}

- (void)dealloc
{
    [personName release];
    [super dealloc];
}

@end
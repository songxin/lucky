//
//  MyDocument.h
//  RaiseMan
//
//  Created by xushiwei on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument {
@private
    NSMutableArray *employees;
}
- (void)setEmployees:(NSMutableArray*)a;
@end
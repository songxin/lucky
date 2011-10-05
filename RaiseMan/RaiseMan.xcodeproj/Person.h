//
//  Person.h
//  RaiseMan
//
//  Created by xushiwei on 11-10-4.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
@private
    
    NSString  *personName;
    float expectedRaise;
}
@property (readwrite, copy) NSString *personName;
@property (readwrite) float expectedRaise;
//- (void)setNilValueForKey:(NSString *)key;
@end

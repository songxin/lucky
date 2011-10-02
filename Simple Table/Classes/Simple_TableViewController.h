//
//  Simple_TableViewController.h
//  Simple Table
//
//  Created by xushiwei on 11-6-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Simple_TableViewController : UIViewController
		<UITableViewDelegate, UITableViewDataSource> {
			NSArray *listData;

}
@property (nonatomic, retain) NSArray *listData;
@end


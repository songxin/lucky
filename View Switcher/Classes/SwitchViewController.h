//
//  SwitchViewController.h
//  View Switcher
//
//  Created by xushiwei on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BlueViewController;
@class YellowViewController;

@interface SwitchViewController : UIViewController {
	BlueViewController *blueViewController;
	YellowViewController *yellowViewController;

}

@property (retain, nonatomic) YellowViewController *yellowViewController;
@property (retain, nonatomic) BlueViewController *blueViewController;

- (IBAction)switchViews:(id)sender;
@end

//
//  DatePickerViewController.h
//  Pickers
//
//  Created by xushiwei on 11-6-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePickerViewController : UIViewController {
	
	UIDatePicker *datePicker;

}
@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
- (IBAction)buttonPressed;
@end

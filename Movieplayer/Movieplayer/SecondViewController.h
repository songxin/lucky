//
//  SecondViewController.h
//  Movieplayer
//
//  Created by xushiwei on 11-9-22.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface SecondViewController : UIViewController {
    NSURL *movieURL;
    
}
@property (nonatomic, retain) NSURL *movieURL;
- (IBAction)playMovieButtonPressed:(id)sender;
- (NSURL*)localMovieURL;
@end

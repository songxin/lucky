//
//  MoviePlayViewController.h
//  MoviePlay
//
//  Created by xushiwei on 11-9-13.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MoviePlayViewController : UIViewController {
     NSURL *movieURL;
    
}
@property (nonatomic, retain) NSURL *movieURL;
-(IBAction)playMovieButtonPressed:(id)sender;
-(NSURL *)localMovieURL;
@end

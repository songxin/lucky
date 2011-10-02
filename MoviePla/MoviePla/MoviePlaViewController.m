//
//  MoviePlaViewController.m
//  MoviePla
//
//  Created by xushiwei on 11-9-11.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "MoviePlaViewController.h"

@implementation MoviePlaViewController
@synthesize movieURL;


- (void) moviePlayBackDidFinish:(NSNotification*)notification {
    
    MPMoviePlayerController *moviePlayer = [notification object];
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:MPMoviePlayerPlaybackDidFinishNotification
                                                 object:moviePlayer];
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {  
        [moviePlayer.view removeFromSuperview];  
    }  
    
    [moviePlayer release];  
     
}

-(IBAction)playMovieButtonPressed:(id)sender
{
    NSLog(@"playMovieButtonPressed");
    
    //   NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:introVideoFileName ofType:@""]];
    NSURL *url = [self localMovieURL];
    MPMoviePlayerController *moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];  
    
    // Register to receive a notification when the movie has finished playing.  
    [[NSNotificationCenter defaultCenter] addObserver:self  
                                             selector:@selector(moviePlayBackDidFinish:)  
                                                 name:MPMoviePlayerPlaybackDidFinishNotification  
                                               object:moviePlayer];  
    
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)]) {  
        // Use the new 3.2 style API  
        moviePlayer.controlStyle = MPMovieControlStyleNone;  
        moviePlayer.shouldAutoplay = YES;  
        [self.view addSubview:moviePlayer.view];  
        [moviePlayer setFullscreen:YES animated:YES];  
    } else {  
        // Use the old 2.0 style API  
        moviePlayer.movieControlMode = MPMovieControlModeHidden;  
        [moviePlayer play];  
    }
}

-(NSURL *)localMovieURL
{
    if (self.movieURL == nil)
    {
        NSBundle *bundle = [NSBundle mainBundle];
        if (bundle) 
        {
            NSString *moviePath = [bundle pathForResource:@"Movie" ofType:@"m4v"];
            if (moviePath)
            {
                self.movieURL = [NSURL fileURLWithPath:moviePath];
            }
        }
    }
    
    return self.movieURL;
}

- (void)dealloc
{
    [movieURL release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

//
//  Scene6ViewController.m
//  PaperMoon
//
//  Created by Andy Woo on 1/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import "Scene6ViewController.h"
#import "PaperMoonAppDelegate.h"

@implementation Scene6ViewController

@synthesize prevButton;
@synthesize topButton = _topButton;
@synthesize nextButton;
@synthesize isTopButtonShown = _isTopButtonShown;
@synthesize menuTapArea = _menuTapArea;
@synthesize musicButton = _musicButton;
@synthesize isMusicOn = _isMusicOn;
@synthesize isMusicButtonShown = _isMusicButtonShown;

- (void)checkMusicSetting {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"music"] == nil)
    {
        self.isMusicOn = YES;
        NSLog(@"Don't have default setting yet!");
        //      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:[NSString stringWithFormat:@"%i", self.isMusicOn] forKey:@"music"];
		[defaults synchronize];
    }
    else
    {
        self.isMusicOn = (BOOL)[defaults boolForKey:@"music"];
        NSLog(@"Weee loaded the music setting!");
    }
    
    if (!self.isMusicOn) {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_stopmusic.png"] forState:UIControlStateNormal];
        NSLog(@"Music is OFF");
    }
    else {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_music.png"] forState:UIControlStateNormal];
        [self playMusic];
        NSLog(@"Music is ON");
    }
}

- (void)playMusic {
        PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate playMusic];
}

- (IBAction)stopMusic {
    if (self.isMusicOn) {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_stopmusic.png"] forState:UIControlStateNormal];
        PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate stopMusic];
        self.isMusicOn = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:[NSString stringWithFormat:@"%i", self.isMusicOn] forKey:@"music"];
		[defaults synchronize];
    }
    else {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_music.png"] forState:UIControlStateNormal];
        PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate playMusic];
        self.isMusicOn = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:[NSString stringWithFormat:@"%i", self.isMusicOn] forKey:@"music"];
		[defaults synchronize];
        
    }
}

-(void)showButtons
{
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,45);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,40);
            } completion:NULL];
        }
    }];
    /*
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.creditButton.center = CGPointMake(440,98);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.creditButton.center = CGPointMake(440,93);
            } completion:NULL];
        }
    }];
     */
}

- (IBAction)menuTap:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (self.isTopButtonShown) {
            
            [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.topButton.alpha = 0.0;
            } completion:NULL];
            self.isTopButtonShown = NO;
        }
        else {
            [UIView animateWithDuration:2.0 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.topButton.alpha = 0.5;
            } completion:NULL];
            self.isTopButtonShown = YES;
        }
        
        if (self.isMusicButtonShown) {
            
            [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,-40);
            } completion:NULL];
            self.isMusicButtonShown = NO;
        }
        else {
            
            [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,45);
            } completion:^(BOOL finished) {
                if (finished) {
                    [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                        self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,40);
                    } completion:NULL];
                    self.isMusicButtonShown = YES;
                }
            }];
        }
    }
}

- (IBAction)prevButton:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
 //   [timerNextScene invalidate];
}

-(IBAction)nextButton:(id)sender
{
    [self performSegueWithIdentifier:@"CutMoonFox" sender:self];
  //  [timerNextScene invalidate];
    
}
- (IBAction)segueToTopScene {
                [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

- (void)segueToNextScene
{
    [self performSegueWithIdentifier:@"CutMoonFox" sender:self];
  //  [timerNextScene invalidate];
}    

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
 // Timer to next scene
 //   timerNextScene = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self
 //                   selector:@selector(segueToNextScene) userInfo:nil repeats:NO];  
    
    UITapGestureRecognizer *menuTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(menuTap:)];
    menuTap.numberOfTapsRequired = 1;
    [self.menuTapArea addGestureRecognizer:menuTap];
 
    [self checkMusicSetting];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self checkMusicSetting];
}

- (void)viewDidUnload
{
    [self setTopButton:nil];
    [self setMenuTapArea:nil];
    [self setMusicButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end

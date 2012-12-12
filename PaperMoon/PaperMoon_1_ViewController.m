//
//  1.m
//  PaperMoon
//
//  Created by Andy Woo on 9/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "PaperMoon_1_ViewController.h"
#import "Wave_1.h"
#import "MoonFox.h"
#import "GoomaComing.h"
#import "PaperMoonAppDelegate.h"

@implementation PaperMoon_1_ViewController

@synthesize mWave_1;
@synthesize moonFox;
@synthesize goomaComing;
@synthesize topButton = _topButton;
@synthesize isTopButtonShown = _isTopButtonShown;
@synthesize menuTapArea=_menuTapArea;
@synthesize musicButton = _musicButton;
@synthesize isMusicButtonShown = _isMusicButtonShown;
@synthesize isMusicOn = _isMusicOn;


- (void)playMusic {
    PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate playMusic];
    [appDelegate playWaveSoundEffect];
}

- (IBAction)stopMusic {
    if (self.isMusicOn) {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_stopmusic.png"] forState:UIControlStateNormal];
        PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate stopMusic];
        [appDelegate stopWaveSoundEffect];
        self.isMusicOn = NO;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:[NSString stringWithFormat:@"%i", self.isMusicOn] forKey:@"music"];
		[defaults synchronize];
    }
    else {
        [self.musicButton setImage:[UIImage imageNamed:@"btn_music.png"] forState:UIControlStateNormal];
        PaperMoonAppDelegate *appDelegate = (PaperMoonAppDelegate *)[[UIApplication sharedApplication] delegate];
        [appDelegate playMusic];
        [appDelegate playWaveSoundEffect];
        self.isMusicOn = YES;
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setObject:[NSString stringWithFormat:@"%i", self.isMusicOn] forKey:@"music"];
		[defaults synchronize];
        
    }
}

- (IBAction)menuTap:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        if (self.isTopButtonShown) {
            
            [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
                self.topButton.alpha = 0.0;
            } completion:NULL];
            self.isTopButtonShown = NO;
        }
        else {
            [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}

- (IBAction)seguetoPrevScene {
   [self.navigationController popViewControllerAnimated:YES];
}


/*
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)gesture 
{
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        [self performSegueWithIdentifier:@"PaperMoon" sender:self];
        
    }
}
 */

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // Timer to animate Wave
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
								   selector:@selector(moveWave) userInfo:nil repeats:YES];   
    [mWave_1 setSpeedX:1.5 Y:1.2];
    
    // Timer to animate Boat
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
								   selector:@selector(moveBoat) userInfo:nil repeats:YES];   
    [moonFox setSpeedX:1.0 Y:1.0];
    
    
    // Timer to animate GoomaComing
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
								   selector:@selector(moveGooma) userInfo:nil repeats:YES];   
    [goomaComing setSpeedX:1.0 Y:1.0];
    
    UITapGestureRecognizer *menuTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(menuTap:)];
    menuTap.numberOfTapsRequired = 1;
    [self.menuTapArea addGestureRecognizer:menuTap];
    
        [self checkMusicSetting];

}

- (void)viewWillAppear:(BOOL)animated {
    [self checkMusicSetting];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    goomaComing.hidden = NO;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setTopButton:nil];
    [self setMenuTapArea:nil];
    [self setMusicButton:nil];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

-(void)moveWave
{
    [mWave_1 move];
}

-(void)moveBoat
{
    [moonFox move];
}

-(void)moveGooma
{
    [goomaComing move];
}


@end

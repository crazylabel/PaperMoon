//
//  PaperMoon_2_ViewController.m
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "PaperMoon_2_ViewController.h"
#import "Wave3.h"
#import "Gooma.h"
#import "BigMoonFox3.h"
#import "PaperMoonAppDelegate.h"

@implementation PaperMoon_2_ViewController

@synthesize mWave3;
@synthesize gooma;
@synthesize bigMoonFox3;
@synthesize player;
@synthesize targetMoonFox;
@synthesize targetMoonFox2;
@synthesize targetMoonCat;
@synthesize targetMoonCat2;
@synthesize targetMoonBird;
@synthesize nextButton;
@synthesize prevButton;
@synthesize topButton = _topButton;
@synthesize menuTapArea= _menuTapArea;
@synthesize isTopButtonShown = _isTopButtonShown;
@synthesize musicButton = _musicButton;
@synthesize isMusicOn = _isMusicOn;
@synthesize isMusicButtonShown = _isMusicButtonShown;

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
//    self.player = nil;
    [self.navigationController popViewControllerAnimated:YES];
//    [timerNextScene invalidate];
}

-(IBAction)nextButton:(id)sender
{
    self.player = nil;
    [self performSegueWithIdentifier:@"PickUpMoonFox" sender:self];
 //   [timerNextScene invalidate];
    
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:targetMoonFox];
        //     NSLog(@"translation.y = %g", translation.y);
        CGFloat tmpX = targetMoonFox.center.x + translation.x;
        CGFloat tmpY = targetMoonFox.center.y + translation.y;
        targetMoonFox.center = CGPointMake(tmpX, tmpY);
        [gesture setTranslation:CGPointZero inView:targetMoonFox];
    }
}
- (IBAction)segueToTopScene {
    [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

- (void)segueToNextScene
{
 //   self.player = nil;

    [self performSegueWithIdentifier:@"PickUpMoonFox" sender:self];
//    [timerNextScene invalidate];
}    

- (IBAction)seguetoPrevScene {
    // [self performSegueWithIdentifier:@"MoonFox" sender:self];
    [self.navigationController popViewControllerAnimated:YES];
}


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
    [mWave3 setSpeedX:0.5 Y:1.2];
    
    // Timer to animate Boat
    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self
								   selector:@selector(moveGooma) userInfo:nil repeats:YES];   
    [gooma setSpeedX:1.5 Y:1.5];
    
    // Timer to animate Big Moon Fox
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
								   selector:@selector(moveBigMoonFox) userInfo:nil repeats:YES];   
    [bigMoonFox3 setSpeedX:0.5 Y:0.5];
    
    // Timer to next scene
 //   timerNextScene = [NSTimer scheduledTimerWithTimeInterval:30.0 target:self
 //                                                   selector:@selector(segueToNextScene) userInfo:nil repeats:NO];  
    
    [targetMoonFox addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:targetMoonFox action:@selector(pan:)]];
    [targetMoonFox2 addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:targetMoonFox2 action:@selector(pan:)]];
 //   [targetMoonFox2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:targetMoonFox2 action:@selector(doubletap:)]];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:targetMoonFox2 action:@selector(doubletap:)];
    doubleTap.numberOfTapsRequired = 2;
    [targetMoonFox2 addGestureRecognizer:doubleTap];
    
    [targetMoonCat addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:targetMoonCat action:@selector(pan:)]];
    [targetMoonCat2 addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:targetMoonCat2 action:@selector(pan:)]];
    [targetMoonBird addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:targetMoonBird action:@selector(pan:)]];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:targetMoonFox
								   selector:@selector(jiggle) userInfo:nil repeats:YES];  
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:targetMoonFox2
								   selector:@selector(jiggle) userInfo:nil repeats:YES];  
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:targetMoonCat
								   selector:@selector(jiggle) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:targetMoonCat2
								   selector:@selector(jiggle) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:targetMoonBird
								   selector:@selector(jiggle) userInfo:nil repeats:YES];   
    
    [targetMoonFox2 setDelegate:self];
    [targetMoonFox2 setCount:(arc4random()%100)+1];
    [targetMoonFox setCount:(arc4random()%100)+1];
    [targetMoonCat setCount:(arc4random()%100)+1];
    [targetMoonCat2 setCount:(arc4random()%100)+1];
    [targetMoonBird setCount:(arc4random()%100)+1];

    UITapGestureRecognizer *menuTap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(menuTap:)];
    menuTap.numberOfTapsRequired = 1;
    [self.menuTapArea addGestureRecognizer:menuTap];

    [self checkMusicSetting];
}

-(void)moveWave
{
    [mWave3 move];
}

-(void)moveGooma
{
    [gooma move];
}

-(void)moveBigMoonFox
{
    [bigMoonFox3 move];
}

- (void)viewDidUnload
{
    [self setNextButton:nil];
    [self setTopButton:nil];
    [self setMenuTapArea:nil];
    [self setMusicButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end

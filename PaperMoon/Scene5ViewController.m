//
//  Scene5ViewController.m
//  PaperMoon
//
//  Created by Andy Woo on 1/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import "Scene5ViewController.h"
#import "PaperMoonAppDelegate.h"

@implementation Scene5ViewController

@synthesize prevButton;
@synthesize topButton = _topButton;
@synthesize nextButton;
@synthesize isTopButtonShown = _isTopButtonShown;
@synthesize player;
@synthesize doorView = _doorView;
@synthesize menuTapArea = _menuTapArea;
@synthesize musicButton = _musicButton;
@synthesize isMusicOn = _isMusicOn;
@synthesize isMusicButtonShown = _isMusicButtonShown;
@synthesize goomaWalking = _goomaWalking;
@synthesize animatedBackground = _animatedBackground;
@synthesize animatedDoor = _animatedDoor;
@synthesize animatedGreen = _animatedGreen;

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

- (IBAction)singleTap:(UIGestureRecognizer *)gesture
{
    [self.player play];
    
}

- (IBAction)prevButton:(id)sender 
{
    [self.navigationController popViewControllerAnimated:YES];
//    [timerNextScene invalidate];
}

-(IBAction)nextButton:(id)sender
{
    [self performSegueWithIdentifier:@"MoonFoxMelting" sender:self];
 //   [timerNextScene invalidate];
    
}
- (IBAction)segueToTopScene {
            [self.navigationController popToViewController:[[self.navigationController viewControllers] objectAtIndex:0] animated:YES];
}

- (void)segueToNextScene
{
    [self performSegueWithIdentifier:@"MoonFoxMelting" sender:self];
 //   [timerNextScene invalidate];
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
-(void)doGoomaWalkingAnimation {
// goomaWalking
NSMutableArray *images = [[NSMutableArray alloc] init];
for (int i=1; i<=17; i++)
{
    [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%u-gooma-scene5.png", i]]];
}


self.goomaWalking.animationImages = images;
[images removeAllObjects];
images = nil;
self.goomaWalking.animationDuration = 5.0;
self.goomaWalking.animationRepeatCount = 1;
[self.goomaWalking startAnimating];

UIBezierPath *trackPath = [UIBezierPath bezierPath];
[trackPath moveToPoint:CGPointMake(150, 170)];
[trackPath addLineToPoint:CGPointMake(640, 170)];

//   [trackPath addCurveToPoint:CGPointMake(300, 120)
//                controlPoint1:CGPointMake(320, 0)
//                controlPoint2:CGPointMake(300, 80)];
//   [trackPath addCurveToPoint:CGPointMake(80, 380)
//                controlPoint1:CGPointMake(300, 200)
//                controlPoint2:CGPointMake(200, 480)];
[self.goomaWalking.layer setPosition:CGPointMake(0, 0)];
[self.view.layer addSublayer:self.goomaWalking.layer];

CAKeyframeAnimation *goomaAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
goomaAnimation.path = trackPath.CGPath;
//   anim.rotationMode = kCAAnimationRotateAuto;
goomaAnimation.repeatCount = 1;
goomaAnimation.duration = 9.0;
goomaAnimation.timingFunctions = [NSArray arrayWithObjects:
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],	                                       nil];
goomaAnimation.removedOnCompletion = YES;
goomaAnimation.fillMode = kCAFillModeForwards;
[self.goomaWalking.layer addAnimation:goomaAnimation forKey:@"race"];
[self.view.layer insertSublayer:self.goomaWalking.layer below:self.animatedDoor.layer];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
 // Timer to next scene
 //   timerNextScene = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self
 //                   selector:@selector(segueToNextScene) userInfo:nil repeats:NO];  
    UITapGestureRecognizer *menutap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(menuTap:)];
    menutap.numberOfTapsRequired = 1;
    [self.menuTapArea addGestureRecognizer:menutap];
    
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc]
                                         initWithTarget:self action:@selector(singleTap:)];
    singletap.numberOfTapsRequired = 1;
    [self.doorView addGestureRecognizer:singletap];
    
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"door-knock-1"
                                                              ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    //   [fileURL release];
    self.player = newPlayer;
    //   [newPlayer release];
    player.numberOfLoops = 0; // Play once
    player.currentTime = 0; // start at beginning
    player.volume = 1;
    
    [self checkMusicSetting];
    
    [self doGoomaWalkingAnimation];
  
    
    CALayer *greenLayer = [CALayer layer];
    greenLayer.position = CGPointMake(0, 0);
    greenLayer.frame = CGRectMake(0, 0, 568, 320);
    greenLayer.contents = (id) [UIImage imageNamed:@"1-green-scene5.png"].CGImage;
    
    [self.view.layer insertSublayer:greenLayer below:self.nextButton.layer];
    
    
/*
    // animated background
    NSMutableArray *images2 = [[NSMutableArray alloc] init];
    for (int i=1; i<=17; i++)
    {
        [images2 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%u-bg-scene5.png", i]]];
    }
    
    self.animatedBackground.animationImages = images2;
    self.animatedBackground.animationDuration = 5.0;
    self.animatedBackground.animationRepeatCount = 1;
    self.animatedBackground.image = [images2 lastObject];
    [self.animatedBackground startAnimating];
 
*/ 
/*
    // animated door
    NSMutableArray *images3 = [[NSMutableArray alloc] init];
    for (int i=1; i<=33; i++)
    {
        [images3 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%u-door-scene5.png", i]]];
    }
    
    self.animatedDoor.animationImages = images3;
    self.animatedDoor.animationDuration = 5.0;
    self.animatedDoor.animationRepeatCount = 1;
    self.animatedDoor.image = [images3 lastObject];
    [self.animatedDoor startAnimating];
 */
 
 /*
    // animated green
    NSMutableArray *images4 = [[NSMutableArray alloc] init];
    for (int i=1; i<=17; i++)
    {
        [images4 addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%u-green-scene5.png", i]]];
    }
    
    self.animatedGreen.animationImages = images4;
    
    self.animatedGreen.animationDuration = 5.0;
    self.animatedGreen.animationRepeatCount = 1;
    self.animatedGreen.image = [images4 lastObject];
    [self.animatedGreen startAnimating];
*/
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [self checkMusicSetting];
//    [self.goomaWalking startAnimating];
 //    [self doGoomaWalkingAnimation];
    
}

- (void)viewDidUnload
{
    [self setTopButton:nil];
    [self setDoorView:nil];
    [self setMenuTapArea:nil];
    [self setMusicButton:nil];
    [self setGoomaWalking:nil];
    [self setAnimatedBackground:nil];
    [self setAnimatedDoor:nil];
    [self setAnimatedGreen:nil];
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

//
//  PaperMoonViewController.m
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "PaperMoonViewController.h"
#import "Wave.h"
#import "Boat.h"
#import "Sail.h"
#import "Scene1View.h"
#import "PaperMoonAppDelegate.h"
#import "CreditViewController.h"


@interface PaperMoonViewController() <DismissCreditViewDelegate>
@property (nonatomic, weak) IBOutlet Scene1View *scene1View;
@end


@implementation PaperMoonViewController
@synthesize musicButton = _musicButton;

@synthesize scene1View = _scene1View;
@synthesize mWave;
@synthesize mBoat;
@synthesize mSail;
@synthesize pullToStartLabel = _pullToStartLabel;
@synthesize creditButton = _creditButton;
@synthesize isMusicOn = _isMusicOn;
@synthesize isTitleShown = _isTitleShown;
@synthesize titleAnimated = _titleAnimated;
@synthesize images = _images;
@synthesize titleView = _titleView;



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



- (void)dismissCreditView:(CreditViewController *)sender
{

    [self dismissModalViewControllerAnimated:YES];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"ShowCreditView"]) {
        CreditViewController *credit = (CreditViewController *)segue.destinationViewController;
        credit.delegate = self;
      
    }
}

- (void)showTitle
{
    if (self.isTitleShown == NO) {
        self.isTitleShown = YES;
        self.titleAnimated.hidden = NO;
        [self doTitleAnimation];
         NSLog(@"show title");
        
/*
        CALayer *layer = [CALayer layer];
        [layer setPosition:CGPointMake(284.0, 160.0)];
        [layer setBounds:CGRectMake(0.0, 0.0, 480.0, 320.0)];
        [self.view.layer addSublayer:layer];
        CAKeyframeAnimation *titleanimation = [CAKeyframeAnimation animation];
        [titleanimation setKeyPath:@"contents"];
        [titleanimation setValues:self.images];
        [titleanimation setCalculationMode:kCAAnimationDiscrete];
        [titleanimation setDuration:3.0f];
        [titleanimation setDelegate:self];
        [titleanimation setAutoreverses:NO];
        [titleanimation setRemovedOnCompletion:NO];
        [titleanimation setValue:@"Title" forKey:@"name"];
        [layer addAnimation:titleanimation forKey:nil];
        titleanimation = nil;
        layer = nil;
 */
    }
}

- (void)segueToNextScene
{
    [timerForward invalidate];
    mSail.hidden = YES;
    self.isTitleShown = NO;
    self.titleAnimated.hidden = YES;
    [self unDoTitleAnimation];
    [self performSegueWithIdentifier:@"MoonFox" sender:self];
}    

- (void)setScene1View:(Scene1View *)scene1View
{
    _scene1View = scene1View;
}

- (void)forwardBoat
{
    // Timer to animate Boat
    timerForward = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
                                           selector:@selector(moveBoatForward) userInfo:nil repeats:YES];
    
    [mBoat setSpeedX:1.0 Y:1.0];

    
}

- (void)showLabel
{
    if (mSail.hidden) 
    {
        if (self.pullToStartLabel.alpha == 0.5f)
        {
            [UIView beginAnimations:nil context:nil]; // begins animation block
            [UIView setAnimationDuration:0.75];        // sets animation duration
            [UIView setAnimationDelegate:self];        // sets delegate for this block
            self.pullToStartLabel.alpha = 0.0f;       // Fades the alpha channel of this view to "0.0" over the animationDuration of "0.75" seconds
            [UIView commitAnimations];   // commits the animation block.  This Block is
            
        } else
        {
            [UIView beginAnimations:nil context:nil]; // begins animation block
            [UIView setAnimationDuration:0.75];        // sets animation duration
            [UIView setAnimationDelegate:self];        // sets delegate for this block
            self.pullToStartLabel.alpha = 0.5f;       // Fades the alpha channel of this view to "0.0" over the animationDuration of "0.75" seconds
            [UIView commitAnimations];   // commits the animation block.  This Block is
        }
    }
}

- (void)hideLabel
{
            [UIView beginAnimations:nil context:nil]; // begins animation block
            [UIView setAnimationDuration:0.75];        // sets animation duration
            [UIView setAnimationDelegate:self];        // sets delegate for this block
            self.pullToStartLabel.alpha = 0.0f;       // Fades the alpha channel of this view to "0.0" over the animationDuration of "0.75" seconds
            [UIView commitAnimations];   // commits the animation block.  This Block is
            
}


- (IBAction)handlePan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:mSail];
        
        // Open Sail
        if (translation.y >= 20) {
           [gesture setTranslation:CGPointZero inView:mSail];
            if (mSail.hidden == YES) {
                mSail.hidden = NO;
                mBoat.hidden = YES;
                
                // Hide Music Button
                [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,-40);
                } completion:NULL];
                
                // Hide Credit Button
                [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.creditButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,-40);
                } completion:NULL];
                
                
                [self forwardBoat];
                [self hideLabel];
            }
        // Close Sail    
        } else if (translation.y <0) {
            if (mSail.hidden == NO) {
                mSail.hidden = YES;
                mBoat.hidden = NO;
                

                [self showButtons];
                [self showLabel];
                [timerForward invalidate];
            }
        }
    }
}



- (void)setupScene {
    self.isTitleShown = NO;
    
  //    self.isMusicOn = YES;
    // Timer to animate Label
    timerLabel = [NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(showLabel) userInfo:nil repeats:YES];
    
    // Timer to animate Wave    
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
								   selector:@selector(moveWave) userInfo:nil repeats:YES];   
    [mWave setSpeedX:1.0 Y:1.0];
    
    // Timer to animate Boat
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
                                           selector:@selector(moveBoat) userInfo:nil repeats:YES];   
    [mBoat setSpeedX:1.0 Y:1.0];
    
    
    // Timer to animate Sail
    timerSail = [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self
                                               selector:@selector(moveSail) userInfo:nil repeats:YES]; 
    [mSail addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)]];
    [mSail setSpeedX:1.0 Y:1.0];
    
    [mBoat setDelegate:self];
    
    
    [self.scene1View setNeedsDisplay];
    
    [self showButtons];
}


-(void)showButtons
{
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
 //       self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,45);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.musicButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,40);
            } completion:NULL];
        }
    }];
    
    [UIView animateWithDuration:0.8 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
  //      self.creditButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,98);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:0.4 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.creditButton.center = CGPointMake([[UIScreen mainScreen] bounds].size.height-40,93);
            } completion:NULL];
        }
    }];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.


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

-(void)unDoTitleAnimation
{
    
    [self.titleView.layer removeAllAnimations];
 
}

-(void)doTitleAnimation
{
    self.titleView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.titleView.layer.shadowOffset = CGSizeMake(2.5, 2.5);
    self.titleView.layer.shadowRadius = 3.0;
    self.titleView.layer.shadowOpacity = 0.55;
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.duration = 1.0f;
    pathAnimation.calculationMode = kCAAnimationLinear;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    self.titleView.layer.position = CGPointMake([[UIScreen mainScreen] bounds].size.height/2, -140);
    
    CGMutablePathRef pointPath = CGPathCreateMutable();
    
    CGPathMoveToPoint(pointPath, NULL,[[UIScreen mainScreen] bounds].size.height/2 , -140);
    CGPathAddLineToPoint(pointPath, NULL, [[UIScreen mainScreen] bounds].size.height/2,[[UIScreen mainScreen] bounds].size.width/2-20);
    CGPathAddLineToPoint(pointPath, NULL, [[UIScreen mainScreen] bounds].size.height/2,[[UIScreen mainScreen] bounds].size.width/2-25);
    pathAnimation.path = pointPath;
    CGPathRelease(pointPath);
    
    CAKeyframeAnimation *rotateAnimation;
    rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.duration = 1.0f;
    rotateAnimation.cumulative = YES;
    rotateAnimation.repeatCount = 1;
    rotateAnimation.values = [NSArray arrayWithObjects:   	// i.e., Rotation values for the 3 keyframes, in RADIANS
                        [NSNumber numberWithFloat: 0.0 * M_PI],
                        [NSNumber numberWithFloat: 0.05 * M_PI],
                        [NSNumber numberWithFloat: -0.05 * M_PI],
                        [NSNumber numberWithFloat: 0.0 * M_PI],
                        [NSNumber numberWithFloat: 0.0 * M_PI], nil];
    rotateAnimation.keyTimes = [NSArray arrayWithObjects:     // Relative timing values for the 3 keyframes
                          [NSNumber numberWithFloat: 0.0],
                          [NSNumber numberWithFloat: 0.1],
                          [NSNumber numberWithFloat: 0.4],
                          [NSNumber numberWithFloat: 0.5],
                          [NSNumber numberWithFloat: 0.0], nil];
    rotateAnimation.timingFunctions = [NSArray arrayWithObjects:
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],	// from keyframe 1 to keyframe 2
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                       [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                       nil];	// from keyframe 2 to keyframe 3
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.fillMode = kCAFillModeForwards;
    
    
    [self.titleView.layer addAnimation:pathAnimation forKey:@"pathAnimation"];
    [self.titleView.layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
    
    pathAnimation = nil;
    pointPath = nil;
    rotateAnimation = nil;
    
    
   // CGAffineTransform rotateTrans = CGAffineTransformMakeRotation(angle * M_PI / 180);
    
 //   myView.transform = CGAffineTransformConcat(scaleTrans, rotateTrans);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkMusicSetting];
    [self setupScene];
  //  [self doTitleAnimation];
                             
}
       

-(void)moveWave
{
    [mWave move];
}

-(void)moveBoat
{
    [mBoat move];
}

-(void)moveSail
{
    [mSail move];
}


- (void) shrinkBoatForward
{
    [mBoat shrink];
}
-(void)moveBoatForward
 {
     [mBoat forward];
     [mSail forward];
     
 }


 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
 interfaceOrientation == UIInterfaceOrientationLandscapeRight);
 }


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [self setTitleView:nil];
    [self setTitleAnimated:nil];
    [self setCreditButton:nil];
    [self setMusicButton:nil];
    [self setPullToStartLabel:nil];
    [self setScene1View:nil];
    [self setMWave:nil];
    [self setMSail:nil];
    [self setMBoat:nil];
    [self setPullToStartLabel:nil];
    [self setImages:nil];
    [self setTitleView:nil];

    timerForward = nil;
    timerLabel = nil;
    timerSail = nil;
}

- (void)viewWillDisappear:(BOOL)animated {
     self.titleView.layer.position = CGPointMake([[UIScreen mainScreen] bounds].size.height/2, -240);
}

- (void)viewWillAppear:(BOOL)animated {
    mBoat.hidden = NO;
    self.titleAnimated.hidden = YES;
    [self checkMusicSetting];
    if (self.musicButton.center.y<0) [self showButtons];
   
  
    
}


@end

//
//  movableObject.m
//  PaperMoon
//
//  Created by Andy Woo on 2/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import "movableObject.h"
#define PI 3.14159


@implementation movableObject

@synthesize count;
@synthesize delegate = _delegate;
@synthesize soundEffectPlayer;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        boatHeight = 1;
    }
    return self;
}

- (void)pauseToNextScene 
{
    [self setImage:[UIImage imageNamed:@"targetMoonFox2.png"]];
    [self setCenter:CGPointMake(self.center.x, self.center.y+5)];
    [self.delegate segueToNextScene];
}

- (IBAction)doubletap:(UIGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self setImage:[UIImage imageNamed:@"targetMoonFox2Selected.png"]];
        [self setCenter:CGPointMake(self.center.x, self.center.y-5)];
        [self playSound];
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(pauseToNextScene) userInfo:nil repeats:NO];
        
    }
}


- (void)playSound
{

    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource: @"happySound"
                                                              ofType: @"wav"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath: soundFilePath];
    AVAudioPlayer *newPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL: fileURL error: nil];
    self.soundEffectPlayer = newPlayer;
    self.soundEffectPlayer.numberOfLoops = 0; // Loop indefinately
    self.soundEffectPlayer.currentTime = 0; // start at beginning
    self.soundEffectPlayer.volume = 0.2;
    [self.soundEffectPlayer play];
}

- (IBAction)pan:(UIPanGestureRecognizer *)gesture
{
    
 //   if (gesture.state == UIGestureRecognizerStateBegan) {
 //    self.transform = CGAffineTransformMakeScale(1.8, 1.8);
 //   }
  //  CGAffineTransform transform = self.transform;
    if (gesture.state == UIGestureRecognizerStateChanged) {
   //     if (CGAffineTransformIsIdentity(transform)) {
          //  self.transform = CGAffineTransformMakeScale(1.8, 1.8);
     //         self.transform=CGAffineTransformMakeRotation (0.5);
       //     NSLog(@"****");
     //   }
        CGPoint translation = [gesture translationInView:self];
        CGFloat tmpX = self.center.x + translation.x;
        CGFloat tmpY = self.center.y + translation.y;
        self.center = CGPointMake(tmpX, tmpY);
        [gesture setTranslation:CGPointZero inView:self];
        
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        CGPoint translation = [gesture translationInView:self];
        CGFloat tmpX = self.center.x + translation.x;
        CGFloat tmpY = self.center.y + translation.y;
        if (tmpY <= 160) {
            tmpY = 160;
        }
        self.center = CGPointMake(tmpX, tmpY);
        [gesture setTranslation:CGPointZero inView:self];
    }
}

- (void)jiggle {
	if (self.center.y >= 160) {
        double tempA=0.0;
        if (self.count>=360) self.count=0;
        tempA = sin(self.count*PI/180) * 10;
        self.transform=CGAffineTransformMakeRotation (tempA/100);
        self.count++;
    }   
}

@end

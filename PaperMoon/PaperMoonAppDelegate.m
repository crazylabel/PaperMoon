//
//  PaperMoonAppDelegate.m
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "PaperMoonAppDelegate.h"

@implementation PaperMoonAppDelegate

@synthesize window = _window;
@synthesize backgroundMusic = _backgroundMusic;
@synthesize waveSoundEffect = _waveSoundEffect;

-(void)stopWaveSoundEffect
{
    [self.waveSoundEffect pause];
}

-(void)playWaveSoundEffect
{
    [self.waveSoundEffect play];
}

-(void)stopMusic
{
    [self.backgroundMusic pause];
}

-(void)playMusic
{
    [self.backgroundMusic play];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    // Global Background Music
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource: @"yesnomonkey" ofType: @"wav"];
	NSURL *backgroundMusicURL = [[NSURL alloc] initFileURLWithPath:backgroundMusicPath];
	self.backgroundMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
	self.backgroundMusic.numberOfLoops = -1;
	self.backgroundMusic.volume = 0.6;
    
    // Global Wave Sound Effect
    NSString *waveSoundEffectPath = [[NSBundle mainBundle] pathForResource: @"wavesound" ofType: @"wav"];
	NSURL *waveSoundEffectURL = [[NSURL alloc] initFileURLWithPath:waveSoundEffectPath];
	self.waveSoundEffect = [[AVAudioPlayer alloc] initWithContentsOfURL:waveSoundEffectURL error:nil];
	self.waveSoundEffect.numberOfLoops = -1;
	self.waveSoundEffect.volume = 0.1;
    
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end

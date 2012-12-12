//
//  PaperMoonAppDelegate.h
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>


@interface PaperMoonAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AVAudioPlayer *backgroundMusic;
@property (strong, nonatomic) AVAudioPlayer *waveSoundEffect;

-(void)stopMusic;
-(void)playMusic;

-(void)stopWaveSoundEffect;
-(void)playWaveSoundEffect;
@end

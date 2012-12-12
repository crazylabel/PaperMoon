//
//  PaperMoon_2_ViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movableObject.h"
#import <AVFoundation/AVFoundation.h>

@class Wave3;
@class Gooma;
@class BigMoonFox3;

@interface PaperMoon_2_ViewController : UIViewController <movableObjectDelegate> {
    IBOutlet Wave3 *mWave3;
    IBOutlet Gooma *gooma;
    IBOutlet BigMoonFox3 *bigMoonFox3;
//    NSTimer *timerNextScene;
    AVAudioPlayer *player;
}

@property (nonatomic, retain) IBOutlet Wave3 *mWave3;
@property (nonatomic, retain) IBOutlet Gooma *gooma;
@property (nonatomic, retain) IBOutlet BigMoonFox3 *bigMoonFox3;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, retain) IBOutlet movableObject *targetMoonFox;
@property (nonatomic, retain) IBOutlet movableObject *targetMoonFox2;
@property (nonatomic, retain) IBOutlet movableObject *targetMoonCat;
@property (nonatomic, retain) IBOutlet movableObject *targetMoonBird;
@property (nonatomic, retain) IBOutlet movableObject *targetMoonCat2;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (weak, nonatomic) IBOutlet UIView *menuTapArea;

@property (nonatomic) BOOL isTopButtonShown;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;
@property (nonatomic) BOOL isMusicButtonShown;

@end

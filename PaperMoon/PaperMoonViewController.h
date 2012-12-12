//
//  PaperMoonViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Boat.h"
#import <QuartzCore/QuartzCore.h>

@class Wave;
@class Boat;
@class Sail;

@interface PaperMoonViewController : UIViewController <BoatDelegate> {
	IBOutlet Wave *mWave;
    IBOutlet Boat *mBoat;
    IBOutlet Sail *mSail;
    NSTimer *timer;
    NSTimer *timerSail;
    NSTimer *timerForward;
    NSTimer *timerLabel;
}
@property (weak, nonatomic) IBOutlet UIImageView *titleAnimated;
@property (weak, nonatomic) IBOutlet UIImageView *titleView;

@property (nonatomic, retain) IBOutlet Wave *mWave;
@property (nonatomic, retain) IBOutlet Boat *mBoat;
@property (nonatomic, retain) IBOutlet Sail *mSail;
@property (weak, nonatomic) IBOutlet UIButton *pullToStartLabel;
@property (weak, nonatomic) IBOutlet UIButton *creditButton;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;
@property (nonatomic) BOOL isTitleShown;
@property   (nonatomic, retain) NSMutableArray *images;



@end





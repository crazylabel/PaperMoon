//
//  Scene5ViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 1/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Scene5ViewController : UIViewController {
  //    NSTimer *timerNextScene;
}

@property (weak, nonatomic) IBOutlet UIImageView *goomaWalking;
@property (weak, nonatomic) IBOutlet UIImageView *animatedBackground;
@property (weak, nonatomic) IBOutlet UIImageView *animatedDoor;
@property (weak, nonatomic) IBOutlet UIImageView *animatedGreen;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (nonatomic) BOOL isTopButtonShown;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UIView *doorView;
@property (weak, nonatomic) IBOutlet UIView *menuTapArea;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;
@property (nonatomic) BOOL isMusicButtonShown;
@end

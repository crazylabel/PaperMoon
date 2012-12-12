//
//  Scene4ViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 1/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface Scene4ViewController : UIViewController {
 //   NSTimer *timerNextScene;
   AVAudioPlayer *player;
}

@property (weak, nonatomic) IBOutlet UIButton *topButton;

@property (nonatomic, retain) AVAudioPlayer *player;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (nonatomic) BOOL isTopButtonShown;
@property (weak, nonatomic) IBOutlet UIView *menuTapArea;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;
@property (nonatomic) BOOL isMusicButtonShown;
@end

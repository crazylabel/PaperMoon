//
//  movableObject.h
//  PaperMoon
//
//  Created by Andy Woo on 2/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol movableObjectDelegate 
- (void)segueToNextScene;
@end

@interface movableObject : UIImageView {
    double mXSpeed;
	double mYSpeed;
    int boatHeight;
	float mAngle;
}


@property (nonatomic, retain) id <movableObjectDelegate> delegate;
@property (nonatomic, retain) AVAudioPlayer *soundEffectPlayer;
@property (nonatomic) double count;


- (void)jiggle;
- (IBAction)pan:(UIPanGestureRecognizer *)gesture;
- (IBAction)doubletap:(UIGestureRecognizer *)gesture;
- (void)playSound;
@end

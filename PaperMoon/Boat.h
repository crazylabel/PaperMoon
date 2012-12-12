//
//  Boat.h
//  PaperMoon
//
//  Created by Andy Woo on 13/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BoatDelegate 
- (void)segueToNextScene;
- (void)showTitle;
@end


@interface Boat : UIImageView {
	int mXSpeed;
	int mYSpeed;
	float mAngle;
    BOOL isOffScreen;
  //  id <BoatDelegate> delegate;

}
@property (nonatomic, retain) id <BoatDelegate> delegate;
-(void)move;
-(void)setSpeedX:(int)xSpeed Y:(int)ySpeed;
-(void)forward;
-(void)shrink;

@end

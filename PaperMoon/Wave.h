//
//  Wave.h
//  PaperMoon
//
//  Created by Andy Woo on 13/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Wave : UIImageView {
	int mXSpeed;
	int mYSpeed;
	float mAngle;

}
-(void)move;
-(void)setSpeedX:(int)xSpeed Y:(int)ySpeed;

@end

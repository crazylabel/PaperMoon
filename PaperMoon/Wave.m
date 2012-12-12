//
//  Wave.m
//  PaperMoon
//
//  Created by Andy Woo on 13/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Wave.h"
#define PI 3.14159

@implementation Wave

- (void)setSpeedX:(int)xSpeed Y:(int)ySpeed {
	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
	

	double tempY=0.0;
	tempY = sin(self.center.x * 0.375);
	self.center=CGPointMake(self.center.x + mXSpeed, 160.0+tempY*0.25 );
	if (self.center.x >=720) {		
		self.center=CGPointMake(240,self.center.y);
	}
	
}

@end

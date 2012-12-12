//
//  Wave-1.m
//  PaperMoon
//
//  Created by Andy Woo on 21/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "Wave_1.h"
#define PI 3.14159

@implementation Wave_1

- (void)setSpeedX:(double)xSpeed Y:(double)ySpeed {	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
    
	double tempY=0.0;
	tempY = sin(self.center.x * 0.375);
 //   CGRect tempBounds;
 //   tempBounds = self.bounds;
 //   NSLog(@"Wave_1 center = %g", self.center.x);
 //   NSLog(@"Wave_1 bound.x = %g", tempBounds.size.width);
 //   NSLog(@"Wave_1 frame.x = %g", self.frame.size.width);
	self.center=CGPointMake(self.center.x + mXSpeed, 160.0+tempY*0.25 );
    
    
	if (self.center.x >=720) {		
		self.center=CGPointMake(240,self.center.y);
	}
	
}

@end

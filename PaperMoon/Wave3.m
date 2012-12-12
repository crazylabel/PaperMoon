//
//  Wave3.m
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "Wave3.h"

@implementation Wave3

- (void)setSpeedX:(double)xSpeed Y:(double)ySpeed {	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
    
	double tempY=0.0;
	tempY = sin(self.center.x * 0.375);
 //   CGRect tempBounds;
 //   tempBounds = self.bounds;

	self.center=CGPointMake(self.center.x + mXSpeed, 264.0+tempY*0.25 );
    
    
	if (self.center.x >=480) {		
		self.center=CGPointMake(105,self.center.y);
	}
	
}

@end

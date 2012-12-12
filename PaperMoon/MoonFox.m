//
//  MoonFox.m
//  PaperMoon
//
//  Created by Andy Woo on 21/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "MoonFox.h"
#define PI 3.14159

@interface MoonFox()
@property (nonatomic) double count;
@end

@implementation MoonFox

@synthesize count;



- (void)setSpeedX:(int)xSpeed Y:(int)ySpeed {
	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
	
    
	double tempA=0.0;
    
    if (self.count>=180) self.count=0;
//    tempA = sin(self.center.x * 0.375);
    tempA = sin(self.count*PI/180) * 5;
//	self.center=CGPointMake(self.center.x - mXSpeed, self.center.y + tempA);
    double newY = 160 + tempA;
    self.center=CGPointMake(self.center.x, newY);
//    	NSLog(@"%@", NSStringFromCGPoint(self.center));
//    NSLog(@"count = %g", self.count);
//    NSLog(@"count = %g, tempA = %g", self.count, tempA);
//    NSLog(@"centre.y = %g", self.center.y);


    

    self.transform=CGAffineTransformMakeRotation (tempA/100);
  //  self.transform=CGAffineTransformMakeScale(0.6+tempA/5, 0.6+tempA/5);
    self.count++;
}

@end

//
//  GoomaComing.m
//  PaperMoon
//
//  Created by Andy Woo on 12/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "GoomaComing.h"
#define PI 3.14159

@interface GoomaComing()
@property (nonatomic) double count;
@end

@implementation GoomaComing


@synthesize count;


- (void)setSpeedX:(int)xSpeed Y:(int)ySpeed {
	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
	
    
	double tempA=0.0;
    
    tempA = sin(self.count * PI/180) *5;
    
    //	tempA = sin(self.center.x * 0.375);
    
//    double newY = 160 + tempA;
//	self.center = CGPointMake(self.center.x, newY);
    
       self.center=CGPointMake(self.center.x + mXSpeed, 160.0+tempA);
    //    NSLog(@"Boat moving");
    //	NSLog(@"%@", NSStringFromCGPoint(self.center));
    
	if (self.center.x >=230) {		
        //	self.center=CGPointMake(610,self.center.y);
        self.center = CGPointMake(230, self.center.y);
     //   self.hidden = YES;
    }
    
    self.transform=CGAffineTransformMakeRotation (tempA/100);
    self.count++;
}

- (void)forward {
    self.center = CGPointMake(self.center.x + mXSpeed, self.center.y);
}

@end

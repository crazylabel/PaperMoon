//
//  Boat.m
//  PaperMoon
//
//  Created by Andy Woo on 13/09/2011.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Boat.h"
#define PI 3.14159

@interface Boat()
@property (nonatomic) double count;
@end


@implementation Boat

@synthesize delegate = _delegate;
@synthesize count;


- (void)setSpeedX:(int)xSpeed Y:(int)ySpeed {
	
    mXSpeed=xSpeed;
    mYSpeed=ySpeed;
}

- (void)move {
	
    
	double tempA=0.0;
    
    tempA = sin(self.count * PI/180) *5;
    
//	tempA = sin(self.center.x * 0.375);

    double newY = 165 + tempA;
	self.center = CGPointMake(self.center.x, newY);
    
//    self.center=CGPointMake(self.center.x - mXSpeed, 160.0+tempA);
//    NSLog(@"Boat moving");
//	NSLog(@"%@", NSStringFromCGPoint(self.center));
    
	if (self.center.x <=-120) {		
//	self.center=CGPointMake(610,self.center.y);
        self.center = CGPointMake(240, self.center.y);
        self.hidden = YES;
        [self.delegate segueToNextScene];
    }
    

    
    self.transform=CGAffineTransformMakeRotation (tempA/100);
    self.count++;
}

- (void)shrink {

 //   self.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.5, 0.5));
}

- (void)forward {
    self.center = CGPointMake(self.center.x - mXSpeed, self.center.y);
    [self shrink];
    
    if (self.center.x <=10) {
        [self.delegate showTitle];
     //   NSLog(@"show title");
    }
}

@end

//
//  MoonFox.h
//  PaperMoon
//
//  Created by Andy Woo on 21/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoonFox : UIImageView {
	int mXSpeed;
	int mYSpeed;
	float mAngle;
    
}
-(void)move;
-(void)setSpeedX:(int)xSpeed Y:(int)ySpeed;

@end

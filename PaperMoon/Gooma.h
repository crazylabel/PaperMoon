//
//  Gooma.h
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Gooma : UIImageView {
	double mXSpeed;
	double mYSpeed;
	float mAngle;
    
}
-(void)move;
-(void)setSpeedX:(double)xSpeed Y:(double)ySpeed;
@end

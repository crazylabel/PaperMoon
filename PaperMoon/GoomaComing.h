//
//  GoomaComing.h
//  PaperMoon
//
//  Created by Andy Woo on 12/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoomaComing: UIImageView {
	int mXSpeed;
	int mYSpeed;
	float mAngle;
    
}

-(void)move;
-(void)setSpeedX:(int)xSpeed Y:(int)ySpeed;
-(void)forward;


@end

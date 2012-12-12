//
//  Wave-1.h
//  PaperMoon
//
//  Created by Andy Woo on 21/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wave_1 : UIImageView  {
    
    double mXSpeed;
    double mYSpeed;
    float mAngle;
     
}

-(void)move;
-(void)setSpeedX:(double)xSpeed Y:(double)ySpeed;


@end

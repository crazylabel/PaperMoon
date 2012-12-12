//
//  CustomFlipOverStoryboardSegue.h
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "PaperMoonAppDelegate.h"



@class PaperMoonAppDelegate;

@interface CustomFlipOverStoryboardSegue : UIStoryboardSegue
@property (nonatomic, assign) PaperMoonAppDelegate *appDelegate;
@end

//
//  CustomFlipOverStoryboardSegue.m
//  PaperMoon
//
//  Created by Andy Woo on 8/12/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import "CustomFlipOverStoryboardSegue.h"


@implementation CustomFlipOverStoryboardSegue
@synthesize appDelegate=_appDelegate;


-(void) perform{
    
    self.appDelegate = [[UIApplication sharedApplication] delegate];
    UIViewController *srcViewController = (UIViewController *) self.sourceViewController;
    UIViewController *destViewController = (UIViewController *) self.destinationViewController;
    

    
 
    [UIView commitAnimations];
    [UIView beginAnimations:@"Cross Dissolve" context:nil];
    [UIView setAnimationDuration:1.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
   [UIView setAnimationTransition: UIViewAnimationTransitionNone forView:self.appDelegate.window.rootViewController.view.superview cache:YES];
 //  srcViewController.view.alpha = 0.0f;
  //  destViewController.view.alpha = 1.0f;
    
   
    
    [srcViewController.view removeFromSuperview];
    [UIView commitAnimations];

/*        
        // set up an animation for the transition the content
        CATransition *animation = [CATransition animation];
        [animation setDuration:0.20];
        [animation setType:kCATransitionFade];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
  */  
    
  
 //   [srcViewController.view removeFromSuperview];
    
   // [self.appDelegate.window.layer addAnimation:animation forKey:kCATransition];
    
   [self.appDelegate.window addSubview:destViewController.view];
    self.appDelegate.window.rootViewController=destViewController;
     
 }

@end


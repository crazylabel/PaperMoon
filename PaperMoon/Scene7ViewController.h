//
//  Scene7ViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 1/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Scene7ViewController : UIViewController {
 //   NSTimer *timerNextScene;
}

@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *prevButton;
@property (weak, nonatomic) IBOutlet UIButton *topButton;
@property (nonatomic) BOOL isTopButtonShown;
@property (weak, nonatomic) IBOutlet UIView *menuTapArea;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;
@property (nonatomic) BOOL isMusicButtonShown;
@end

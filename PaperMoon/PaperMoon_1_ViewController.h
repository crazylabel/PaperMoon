//
//  1.h
//  PaperMoon
//
//  Created by Andy Woo on 9/11/11.
//  Copyright (c) 2011 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Wave_1;
@class MoonFox;
@class GoomaComing;

@interface PaperMoon_1_ViewController : UIViewController {
    IBOutlet Wave_1 *mWave_1;
    IBOutlet MoonFox *moonFox;
    IBOutlet GoomaComing *goomaComing;
}

@property (nonatomic, retain) IBOutlet Wave_1 *mWave_1;
@property (nonatomic, retain) IBOutlet MoonFox *moonFox;
@property (nonatomic, retain) IBOutlet GoomaComing *goomaComing;
@property (weak, nonatomic) IBOutlet UIButton *topButton;

@property (nonatomic) BOOL isTopButtonShown;
@property (nonatomic) BOOL isMusicButtonShown;
@property (weak, nonatomic) IBOutlet UIView *menuTapArea;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (nonatomic) BOOL isMusicOn;



@end

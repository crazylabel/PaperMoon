//
//  CreditViewController.h
//  PaperMoon
//
//  Created by Andy Woo on 16/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreditViewController;

@protocol DismissCreditViewDelegate <NSObject>

- (void)dismissCreditView:(CreditViewController *)sender;

@end

@interface CreditViewController : UIViewController

@property (nonatomic, weak) id <DismissCreditViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *buildNumber;
@property (weak, nonatomic) IBOutlet UILabel *versionNumber;

@end

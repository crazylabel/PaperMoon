//
//  CreditViewController.m
//  PaperMoon
//
//  Created by Andy Woo on 16/2/12.
//  Copyright (c) 2012 WOOKIEWEB.COM. All rights reserved.
//

#import "CreditViewController.h"

@interface CreditViewController () 

@end

@implementation CreditViewController

@synthesize delegate = _delegate;
@synthesize buildNumber = _buildNumber;
@synthesize versionNumber = _versionNumber;

- (IBAction)clearCreditView {
    [self.delegate dismissCreditView:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString* buildNumber = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CWBuildNumber"];
    self.buildNumber.text = buildNumber;
    NSString* versionNumber = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    self.versionNumber.text = versionNumber;
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}



- (void)viewDidUnload {
    [self setBuildNumber:nil];
    [self setVersionNumber:nil];
    [super viewDidUnload];
}
@end

//
//  SloofAppDelegate.m
//  Sloof
//
//  Created by Kimberly Barnes on 2/22/09.
//  Copyright Appsolutely 2009. All rights reserved.
//

#import "SloofAppDelegate.h"
#import "SloofViewController.h"

@implementation SloofAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end

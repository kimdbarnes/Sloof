//
//  SloofAppDelegate.h
//  Sloof
//
//  Created by Kimberly Barnes on 2/22/09.
//  Copyright Appsolutely 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SloofViewController;

@interface SloofAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    SloofViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SloofViewController *viewController;

@end


//
//  SloofViewController.h
//  Sloof
//
//  Created by Kimberly Barnes on 2/22/09.
//  Copyright Appsolutely 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"

#define numAlgorithms 3

@interface SloofViewController : UIViewController {

	IBOutlet UIImageView *photoIcon;
	IBOutlet UIImageView *settingsIcon;
	IBOutlet UIImageView *contactsIcon;
	IBOutlet UIImageView *safariIcon;
	IBOutlet UIImageView *stocksIcon;
	IBOutlet UIImageView *calendarIcon;
	IBOutlet UIImageView *weatherIcon;
	IBOutlet UIImageView *mailIcon;
	IBOutlet UIImageView *notesIcon;
	IBOutlet UIImageView *youTubeIcon;
	IBOutlet UIImageView *appStoreIcon;
	IBOutlet UIImageView *calculatorIcon;
	IBOutlet UIImageView *cameraIcon;
	IBOutlet UIImageView *clockIcon;
	IBOutlet UIImageView *ipodIcon;
	IBOutlet UIImageView *textIcon;
	IBOutlet UIImageView *todoIcon;
	IBOutlet UIImageView *itunesIcon;
	IBOutlet UIImageView *phoneIcon;
	IBOutlet UIImageView *mapsIcon;

	NSMutableArray *icons;
	NSArray *iconLocations;
	

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

// Handles the end of a touch event.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

- (CGPoint)getRunawayLocationForIcon:(UIView *)iconToMove 
			withStartingPosition:(CGPoint)iconOriginalLocation 
					 withTouchAt:(CGPoint)touchLocation;

- (CGPoint)getRandomLocationForIcon:(UIView *)iconToMove 
			withStartingPosition:(CGPoint)iconOriginalLocation 
					 withTouchAt:(CGPoint)touchLocation;

- (CGPoint)getCornerLocationForIcon:(UIView *)iconToMove 
			   withStartingPosition:(CGPoint)iconOriginalLocation 
						withTouchAt:(CGPoint)touchLocation;

-(NSValue *)setInitialLocationForIcon:(UIImageView *)icon;

@end


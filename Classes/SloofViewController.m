//
//  SloofViewController.m
//  Sloof
//
//  Created by Kimberly Barnes on 2/22/09.
//  Copyright Appsolutely 2009. All rights reserved.
//

#import "SloofViewController.h"


@implementation SloofViewController


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.3];
	UITouch *firstTouch = [touches anyObject];
	CGPoint touchLocation = [firstTouch locationInView:self.view];

	NSEnumerator *enumerator = [icons objectEnumerator];
	UIImageView *curIcon;
	int algorithm = arc4random() % 3;
	
	while (curIcon = [enumerator nextObject]) {
		CGPoint curLoc = CGPointMake(curIcon.center.x, curIcon.center.y);
		if (algorithm == 0)
			curIcon.center = [self getRandomLocationForIcon:curIcon withStartingPosition:curLoc withTouchAt:touchLocation];		
		else if (algorithm == 1)
			curIcon.center = [self getRunawayLocationForIcon:curIcon withStartingPosition:curLoc withTouchAt:touchLocation];
		else if (algorithm == 2)
			curIcon.center = [self getCornerLocationForIcon:curIcon withStartingPosition:curLoc withTouchAt:touchLocation];
		
	}
	[UIView commitAnimations];
}

// Handles the end of a touch event.
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:.75];

	UIImageView *curIcon;
	
	int disappearingIndex = arc4random() % 50;
	
	for (int i=0; i<[icons count]; i++) 
	{
		curIcon = [icons objectAtIndex:i];
		if (disappearingIndex == i) 
		{
			curIcon.center = CGPointMake(500,500);
		} else {
			CGPoint newLoc;
		    [[iconLocations objectAtIndex:i] getValue:&newLoc];
			curIcon.center = newLoc;
		}
	}	
	[UIView commitAnimations];
	
}


-(CGPoint) getRunawayLocationForIcon: (UIView *)iconToMove withStartingPosition: (CGPoint)iconOriginalLocation withTouchAt:(CGPoint) touchLocation {
	
	CGFloat newXLocation = iconOriginalLocation.x;
	CGFloat newYLocation = iconOriginalLocation.y;
	float difX = (touchLocation.x-iconToMove.center.x);
	float difY = (touchLocation.y-iconToMove.center.y);	
	difX = (difX == 0 ? 1 : difX);
	difY = (difY == 0 ? 1 : difY);
	CGFloat distance = sqrt(difX*difX + difY*difY);
	distance = (2500/distance);
	
	newXLocation -= 2500/difX;
	newYLocation -= 2500/difY;
	
	newXLocation = (newXLocation <= 0 ? 1 : newXLocation);
	newYLocation = (newYLocation <= 0 ? 1 : newYLocation);
	newXLocation = (newXLocation >= 315 ? 300 : newXLocation);
	newYLocation = (newYLocation >= 450 ? 445 : newYLocation);
	
	return CGPointMake(newXLocation, newYLocation);
}	

-(CGPoint) getRandomLocationForIcon: (UIView *)iconToMove withStartingPosition: (CGPoint)iconOriginalLocation withTouchAt:(CGPoint) touchLocation {
	
	return CGPointMake(arc4random() % 400, arc4random() % 400);
}

-(CGPoint) getCornerLocationForIcon: (UIView *)iconToMove withStartingPosition: (CGPoint)iconOriginalLocation withTouchAt:(CGPoint) touchLocation {
	
	int random = arc4random() % 4;
	if (random == 0) 
	{
		return CGPointMake(0, 0);		
	} else if (random == 1) 
	{
		return CGPointMake(320, 0);
	} else if (random == 2)
	{
		return CGPointMake(0, 455);		
	} else 
	{
		return CGPointMake(320, 455);
	}

}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	

	NSValue *photoLoc = [self setInitialLocationForIcon:photoIcon];
	NSValue *settingsLoc = [self setInitialLocationForIcon:settingsIcon];
	NSValue *contactsLoc = [self setInitialLocationForIcon:contactsIcon];
	NSValue *safariLoc = [self setInitialLocationForIcon:safariIcon];
	NSValue *weatherLoc = [self setInitialLocationForIcon:weatherIcon];
	NSValue *stocksLoc = [self setInitialLocationForIcon:stocksIcon];
	NSValue *notesLoc = [self setInitialLocationForIcon:notesIcon];
	NSValue *youTubeLoc = [self setInitialLocationForIcon:youTubeIcon];
	NSValue *mailLoc = [self setInitialLocationForIcon:mailIcon];
	NSValue *calendarLoc = [self setInitialLocationForIcon:calendarIcon];
	NSValue *appStoreLoc = [self setInitialLocationForIcon:appStoreIcon];
	NSValue *calcLoc = [self setInitialLocationForIcon:calculatorIcon];
	NSValue *cameraLoc = [self setInitialLocationForIcon:cameraIcon];
	NSValue *clockLoc = [self setInitialLocationForIcon:clockIcon];
	NSValue *ipodLoc = [self setInitialLocationForIcon:ipodIcon];
	NSValue *textLoc = [self setInitialLocationForIcon:textIcon];
	NSValue *todoLoc = [self setInitialLocationForIcon:todoIcon];
	NSValue *itunesLoc = [self setInitialLocationForIcon:itunesIcon];
	NSValue *phoneLoc = [self setInitialLocationForIcon:phoneIcon];
	NSValue *mapsLoc = [self setInitialLocationForIcon:mapsIcon];	

	icons = [[NSMutableArray arrayWithObjects:mapsIcon, phoneIcon, itunesIcon, todoIcon, 
			 textIcon, ipodIcon, clockIcon, cameraIcon, calculatorIcon, appStoreIcon, 
			 calendarIcon, mailIcon, youTubeIcon, notesIcon, stocksIcon, weatherIcon,
			 safariIcon, contactsIcon, settingsIcon, photoIcon, nil] retain];
	
	iconLocations = [[NSArray arrayWithObjects:mapsLoc, phoneLoc, itunesLoc, todoLoc, textLoc, 
					  ipodLoc, clockLoc, cameraLoc, calcLoc, appStoreLoc, calendarLoc, mailLoc,
					  youTubeLoc, notesLoc, stocksLoc, weatherLoc, safariLoc, contactsLoc, settingsLoc, 
					  photoLoc, nil] retain];
	
}

-(NSValue *)setInitialLocationForIcon:(UIImageView *)icon
{
	
	CGPoint curPoint = CGPointMake(icon.center.x, icon.center.y);
	NSValue *originalLoc = [NSValue value: &curPoint
						 withObjCType:@encode(CGPoint)];

	return originalLoc;	
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
	[icons release];
	[iconLocations release];
}

@end

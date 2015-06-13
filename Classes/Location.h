//
//  Location.h
//  Sloof
//
//  Created by Kimberly Barnes on 3/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Location : NSObject {

	CGPoint point;
}

- (CGPoint)point;
- (void)setPoint:(CGPoint)pt;

@end

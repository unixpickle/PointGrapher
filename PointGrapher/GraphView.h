//
//  GraphView.h
//  PointGrapher
//
//  Created by Alex Nichol on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraphPoint.h"
#import "RectArray.h"

#define kTickSpacing 82.0

@interface GraphView : NSView {
	NSMutableArray * points;
	CGFloat zoomFactor;
	CGPoint translateAxis;
	
	RectArray * labelRects;
	
	NSPoint startDrag;
	CGPoint startTranslate;
}

@property (readonly) CGFloat zoomFactor;

- (void)addPoint:(GraphPoint *)point;
- (void)removePoint:(GraphPoint *)point;
- (NSArray *)allPoints;

- (void)setZoomFactor:(CGFloat)factor;
- (void)centerOrigin;

- (CGPoint)pointForGraphPoint:(GraphPoint *)graphPoint;

@end

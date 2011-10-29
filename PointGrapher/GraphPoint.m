//
//  GraphPoint.m
//  PointGrapher
//
//  Created by Alex Nichol on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GraphPoint.h"

@implementation GraphPoint

@synthesize point, pointName;

- (id)initWithPoint:(CGPoint)_point name:(NSString *)_pointName {
	if ((self = [super init])) {
		point = _point;
		pointName = _pointName;
	}
	return self;
}

@end

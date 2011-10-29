//
//  GraphPoint.h
//  PointGrapher
//
//  Created by Alex Nichol on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphPoint : NSObject {
	CGPoint point;
	NSString * pointName;
}

@property (readwrite) CGPoint point;
@property (nonatomic, strong) NSString * pointName;

- (id)initWithPoint:(CGPoint)_point name:(NSString *)_pointName;

@end

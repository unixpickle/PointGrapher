//
//  RectArray.h
//  PointGrapher
//
//  Created by Alex Nichol on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RectArray : NSObject {
	NSRect * _storage;
	NSUInteger count;
	NSUInteger allocated;
}

- (void)addRect:(NSRect)aRect;
- (void)removeAllRects;

- (NSUInteger)numberOfRects;
- (NSRect)rectAtIndex:(NSUInteger)index;

@end

//
//  RectArray.m
//  PointGrapher
//
//  Created by Alex Nichol on 10/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RectArray.h"

#define kRectBufferSize 10

@implementation RectArray

- (id)init {
	if ((self = [super init])) {
		_storage = (NSRect *)malloc(sizeof(NSRect) * kRectBufferSize);
		allocated = kRectBufferSize;
	}
	return self;
}

- (void)addRect:(NSRect)aRect {
	if (count >= allocated) {
		allocated += kRectBufferSize;
		_storage = (NSRect *)realloc(_storage, sizeof(NSRect) * allocated);
	}
	_storage[count++] = aRect;
}

- (void)removeAllRects {
	count = 0;
	_storage = (NSRect *)realloc(_storage, sizeof(NSRect) * kRectBufferSize);
	allocated = kRectBufferSize;
}

- (NSUInteger)numberOfRects {
	return count;
}

- (NSRect)rectAtIndex:(NSUInteger)index {
	if (index >= count) {
		@throw [NSException exceptionWithName:@"IndexOutOfBounds"
									   reason:@"The specified rect index was out of bounds"
									 userInfo:nil];
	}
	return _storage[index];
}

- (void)dealloc {
	free(_storage);
}

@end

//
//  AppDelegate.m
//  PointGrapher
//
//  Created by Alex Nichol on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize graph = _graph;
@synthesize tableView = _tableView;

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
	GraphPoint * point = [[GraphPoint alloc] initWithPoint:CGPointMake(1, 1) name:@"A"];
	[self.graph addPoint:point];
	[self.tableView reloadData];
}

- (IBAction)zoomIn:(id)sender {
	if (self.graph.zoomFactor > 7) {
		return;
	}
	self.graph.zoomFactor *= 2.0;
}

- (IBAction)zoomOut:(id)sender {
	if (self.graph.zoomFactor < 1.0 / 7.0) {
		return;
	}
	self.graph.zoomFactor /= 2;
}

- (IBAction)revertZoom:(id)sender {
	self.graph.zoomFactor = 1;
}

- (IBAction)center:(id)sender {
	[self.graph centerOrigin];
}

#pragma mark Point Management

- (IBAction)addPoint:(id)sender {
	GraphPoint * point = [[GraphPoint alloc] initWithPoint:CGPointMake(0, 0) name:@"P"];
	[self.graph addPoint:point];
	[self.tableView reloadData];
}

- (IBAction)removePoint:(id)sender {
	NSInteger row = [self.tableView selectedRow];
	if (row >= 0) {
		GraphPoint * point = [[self.graph allPoints] objectAtIndex:row];
		[self.graph removePoint:point];
		[self.tableView reloadData];
	}
}

#pragma mark Table View

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
	return [[self.graph allPoints] count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	GraphPoint * point = [[self.graph allPoints] objectAtIndex:row];
	if ([[tableColumn identifier] isEqualToString:@"nameColumn"]) {
		return [point pointName];
	} else if ([[tableColumn identifier] isEqualToString:@"xColumn"]) {
		return [NSNumber numberWithFloat:[point point].x];
	} else if ([[tableColumn identifier] isEqualToString:@"yColumn"]) {
		return [NSNumber numberWithFloat:[point point].y];
	}
	return @"(null)";
}

- (void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
	GraphPoint * point = [[self.graph allPoints] objectAtIndex:row];
	if ([[tableColumn identifier] isEqualToString:@"nameColumn"]) {
		[point setPointName:object];
	} else if ([[tableColumn identifier] isEqualToString:@"xColumn"]) {
		CGPoint location = point.point;
		location.x = [object floatValue];
		point.point = location;
	} else if ([[tableColumn identifier] isEqualToString:@"yColumn"]) {
		CGPoint location = point.point;
		location.y = [object floatValue];
		point.point = location;
	}
	self.graph.needsDisplay = YES;
}

@end

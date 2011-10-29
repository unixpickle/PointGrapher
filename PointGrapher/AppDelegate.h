//
//  AppDelegate.h
//  PointGrapher
//
//  Created by Alex Nichol on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraphView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate> {
	
}

@property (assign) IBOutlet NSWindow * window;
@property (assign) IBOutlet GraphView * graph;
@property (assign) IBOutlet NSTableView * tableView;

- (IBAction)zoomIn:(id)sender;
- (IBAction)zoomOut:(id)sender;
- (IBAction)revertZoom:(id)sender;
- (IBAction)center:(id)sender;

- (IBAction)addPoint:(id)sender;
- (IBAction)removePoint:(id)sender;

@end

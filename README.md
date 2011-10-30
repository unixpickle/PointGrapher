PointGrapher
===

PointGrapher is a simple Cocoa application written for Mac OS X that can plot points inputted by the user. This could be useful, for instance, in a classroom setting where a diagram needs to be displayed over a projector. Use simple keystrokes for zooming in and out, and drag the mouse around to freely translate the axes.

<center>
![Example screenshot of PointGrapher](https://github.com/unixpickle/PointGrapher/raw/master/example.png)
</center>

## The *GraphView* class

The `GraphView` UIView sub-class provides an easy to use set of methods to create great looking graphs, with multiple points, and with scaling and translating built-in. Here are some methods that `GraphView` responds to:

    - (void)addPoint:(GraphPoint *)point;
    - (void)removePoint:(GraphPoint *)point;
    - (NSArray *)allPoints;
    
    - (void)setZoomFactor:(CGFloat)factor;
    - (void)centerOrigin;

Any on-screen `GraphView` will automatically respond to mouse events, which it will then use for translation. This will give the user the ability to manually pan around the graph.

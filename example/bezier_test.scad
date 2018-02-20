// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

include <bezier.scad>;
resolution = 50;

rotate_extrude($fn = resolution)
        BezPolygon([
                [[0, 0],[0, 0],[0, 0],[0, 0]],
                [[30, 0],[50, 30],[0, 30],[0, 60]]
        ], resolution);


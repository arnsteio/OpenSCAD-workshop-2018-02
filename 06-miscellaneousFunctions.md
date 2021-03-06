# Miscellaneous other functions
1. [The Incredibly useful Hull()](#the-incredibly-useful-hull())
2. [Fast modelling  of rotational objects](#fast-modelling-of-rotational-objects)
3. [Rounded boxes](#rounded-boxes)
4. [STL import](#stl-import)
5. [Including libraries](#including-libraries)

## The incredibly useful Hull()

~~~
/* This example is courtecy of iamwill
(https://cubehero.com/author/orangeroot/)
His blog post at [https://cubehero.com/2013/11/19/know-only-10-things-to-be-dangerous-in-openscad/]
is very good -- arnsteio
*/

union() {
  sphere(r = 20);
  cylinder(h = 30, r1 = 20, r2 = 0);
}
~~~

> However, we want the radius of the cone to match up with the radius of the sphere at a given height we move up the cone. We can use sin and cos to figure that out.
> -- iamwill

~~~
union() {
  sphere(r = 20);
  // See Will's post for extended explanation on the trigonometry
  translate([0, 0, 20 * sin(30)])
     cylinder(h = 30, r1 = 20 * cos(30), r2 = 0);
}
~~~

We can do that, and the code generated is beautiful. But I am lazy, and this gives almost the identical result:
~~~
hull() {
  sphere(r = 20);
  translate([0, 0, 40]) 
     cube(0.01);
}
~~~
Our ["Gothic Roof"](https://www.thingiverse.com/thing:2693666) is made this way - it has a `hull()` around a square at the base, 
and the intersection between two squares at 45 degree angle to each other as the mid-roof "break". 
And another `hull()`around this mid-roof shape and a long, narrow square at the top of the model. 
The whole, fully parametric and decorated roof design was made in 90 minutes.  

## Fast modelling of rotational objects
~~~
/* This demonstrates an easy way to model 6-sided towers
The code makes a 6-sided spire with a perfectly round hole ("window") in it. 
- arnsteio, 2017
*/

$fn=6; // This is how our spire gets 6 sides
height=100;
width=20;            
            difference()
            {
                cylinder(h=height, d1=width, d2=0.01);
		// In the next line we redefine $fn for this object to get a perfectly round hole
                translate([0,height/2,height*0.2]) rotate([90,0,0])cylinder(h=height, d=width/3, $fn=50);
            }
~~~

## Rounded boxes

minkowski() does the [Minkowski sum](https://doc.cgal.org/latest/Minkowski_sum_3/) of child nodes - it adds all the constituent vectors together.

![alt text](bilder/minkowski_spoon_star.png "The Minkowski sum of a spoon and a star.")

The Minkowski sum of a spoon and a star. Picture by Peter Hachenberger.

~~~
// Try doing the minkowski sum on this example 
// by removing the commenting ahead of "minkowski()"!
// It is a very fast method of making a rounded box.
$fn=150;
//minkowski()
{
cube([10,10,1]);
sphere(r=2);
}
~~~

## STL import 
~~~
import("myfile.stl")
~~~

## Including libraries
If you consider e.g. the customizable Klein bottle at <https://www.thingiverse.com/thing:2170953>, it is made possible by heavy use of bezier curves. 
Instead of reimplementing them from scratch the author imports a bezier library he has published previously.
![alt text](bilder/halfKleinBottleByGaelLafond.jpg "Half of the Klein bottle, by Gael Lafond")
*Half of the Klein bottle, by Gael Lafond*

We can use his library [bezier.scad](example/bezier.scad) to make e.g. the beginnings of a minaret:

![alt text](bilder/points_graph_for_rotation.png "The points we give the bezier function")
*The points we give the bezier function*

![alt text](bilder/hull_graph.png "The graph we would have gotten via the hull() function on the same points")
*The graph we would have gotten via the hull() function on the same points*

![alt text](bilder/curve_for_rotation.png "Curve delivered via bezier function")
*Curve delivered via bezier function*

![alt text](bilder/rotation.png "Rotating this curve through 90 degrees")
*Rotating this curve through 90 degrees*
~~~
// Requires the bezier library by Gael Lafond:
//   http://www.thingiverse.com/thing:2170645

include <bezier.scad>;
resolution = 50;

rotate_extrude($fn = resolution)
        BezPolygon([
                [[0, 0],[0, 0],[0, 0],[0, 0]],
                [[30, 0],[50, 30],[0, 30],[0, 60]]
        ], resolution);
~~~


[Previous slide](05-trigonometry_conditionals_loops.md)

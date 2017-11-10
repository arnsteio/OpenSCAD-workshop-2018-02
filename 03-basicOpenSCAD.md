---
title: Basic OpenSCAD
teaching: 30
exercises: 10
questions:
- "What do you need to know to design things in OpenSCAD?"
objectives:
- Be able to use shapes (cube, sphere, cylinder)
- Be able to use CSG operations (union, difference, intersection)
- Be able to use transforms (translate, scale, rotate)
keypoints:
- ""
---

# Basic OpenSCAD operations
##
~~~
/* 
You can easily
use multi-line comments.
Or one-line comments like we do below:
*/

TestNumber = 5; // This sets the variable "TestNumber" to zero
~~~

## Shapes

Open OpenScad, and try this:
~~~
// Test cube
cube([50, 10, 5], center=true);
~~~
Press the F5 key to render your code. 
Everything after "//" is a comment - it is just useful for us humans, it isn't part of the shape.  
"cube" is self explanatury, and the numbers give the lengths - X, Y and Z - of the described shape. 
"center" means the figure will be centered in the origin of the coordinate system as opposed to in the first quadrant (try both if you want).

Now add to the above:
~~~
cube([50, 10, 5],c enter=true);
cylinder(d1=10, d2=40, h=50, center=true);
~~~
Again, press F5 to render.

We can continue doing this - try adding a sphere:
~~~
cube([50, 10, 5],center=true);
cylinder(d1=10, d2=40, h=50, center=true);
sphere(r=20);
~~~
Finding bugs in our code when shapes are inside other shapes can be difficult, putting "%" in front of a shape makes it transparent. 
Try doing that in front of the line with the sphere.
However, we need to be able to combine these to make interesting shapes.

## Constructive Solid Geometry operations
Constructive Solid Geometry (CSG) is a modeling technique that uses Boolean operations like union and intersection to combine 3D solids.
We have:

- union() creates a union of all its child nodes.
- difference() subtracts all child nodes from the first one
- intersection() creates the intersection of all child nodes. Only the area shared by all the objects is retained.

Let's try an example:
~~~
// this example is by Marius Kintel  - <marius@kintel.net>

union() {
    cube(15, center=true);
    sphere(10);
}
~~~
Try cahnging union() to difference() and intersection()!

Excercise: How can you make a shape that only has the "sides" of the sphere - the sphere minus the cube?

## Transforms
Transforms

---

Subjects covered:
- Writing OpenSCAD code
- Getting others’ code, sharing your code
- Exporting and importing from STL
- Preparing STLs for printing with Cura
- Printing on Ultimaker 2+ extruder printer

Learning outcomes:
- Able to design models with OpenSCAD
- Able to print models on extruders

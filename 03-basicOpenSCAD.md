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

// Output a string and the value of "TestNumber":
echo("My number is:");
echo(TestNumber);
~~~

## Shapes

Open OpenScad, and try this:
~~~
cube([50, 10, 5],center=true);
~~~
Press the F5 key to render your code. "cube" is self explanatury, and the numbers give the lengths - X, Y and Z - of the described shape. "center" means the figure will be centered in the origin of the coordinate system as opposed to in the first quadrant (try both if you want).

Now add to the above:
~~~
cube([50, 10, 5],center=true);
cylinder(d1=20, d2=40, center=true);
~~~
Again, press F5 to render.

We can continue doing this - try e.g.
~~~
cube([50, 10, 5],center=true);
cylinder(d1=20, d2=40, center=true);
sphere(r =20);
~~~
However, we need to be able to combine these to make interesting shapes.

## CSG operations
Constructive Solid Geometry (CSG) is a modeling technique that uses Boolean operations like union and intersection to combine 3D solids.

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

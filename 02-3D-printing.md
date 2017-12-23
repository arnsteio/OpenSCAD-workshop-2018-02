# 3D printing

## Slicing software variables

### Raft

A raft attaches your print to the build plate and improves stability. 
When in doubt, use it. 

### Support

Cura or other slicing software can make printing supports automatically. 
It is better to design models in such a way that they don't need support, or make the  required support yourself as part of designing the model.

### Print head size

0.4mm is the standard size of the printer in the library. 
That's fairly big, i.e. prints fairly fast. 
Print head size can matter when you design small details on your models - a 1.0mm thick wall, for example, will print no different than a 0.8mm thick wall.
A 0.3mm thick wall will not print at all. 

### Layer height

The thicker the layer, the faster the print.
However, thicker layers also produce less detailed prints.
I almost always use 0.15mm layer height, which is quite thick.

## The environment

## Servicing the printer

### Changing colour

### Printer problems

## Model problems

Designing models is an iterative process.
You often go several rounds with test prints before you are happy with what you have made. 

#### Lack of support

#### Thin walls

#### Gcode errors

I have had Cura turn fine STL files into Gcode files where some of the layers are skewed on a couple of occasions.
If that happens, simply make a new Gcode in exactly the same way.
Chances are, the next file will be fine.

[Next slide](03-basicOpenSCAD.md)
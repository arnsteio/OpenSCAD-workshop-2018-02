---
title: OpenSCAD workshop
teaching: 5
exercises: 0
questions:
- "What is the 'idea to finished product' 3D design workflow?"
- "Why use OpenSCAD?"
objectives:
- "Understand the 3D design workflow"
- "Know the benefits of automation in 3D modelling."
- "Understand the benefits of parametric designs."
- "Understand the benefits of reusing code."
- "Workflow tools"
keypoints:
- ""
---
# Before we start:
- Does everyone have OpenSCAD installed?
- And Cura?

# 3D design
Imagine a wizard, who is able to conjure up things purely by holding them in his mind and making them physical by willpower alone. 
Designing 3D objects is a bit like that - we describe our objects with code and maths, and make them physical.

## The design process

1) You start with an __idea for a thing__ - something you want to make.
2) You __make a digital model__ of that thing. The digital model can be in any of a number of formats - in this course we use OpenSCAD.
3) An extruder (the type of 3D printer we work with) is really just a hot glue gun controlled by a computer.
The printer needs specific instructions on where to move the print head and how much material to deposit in each place.
The Gcode format is used for this.
The  programs that make Gcode instructions from models all read the STL file format, so you should __export your model to .stl__.
4) You can import  your .stl file to the Cura program (or a similar program) and  __make a Gcode file__. The Gcode file is what you give the printer.

```

STL (an abbreviation of "stereolithography") is a file format native to the stereolithography CAD software created by 3D Systems.
STL files describe only the surface geometry of a three-dimensional object without any representation of color, texture or other common CAD model attributes.
```
```
Add idea -> openscad -> STL and then STL -> Cura -> Printer picture here
```
![alt text](bilder/wizard.png "Wizard")

## Why OpenSCAD
OpenSCAD is great at making parametric designs — models represented by numbers that can be easily adjusted to change the size, shape, or any other aspect of a design.
It creates designs based on precise measurements or specific tolerances, that can have moving parts, and use mathematical or procedural information - hence it is great for different scientific applications.
It is completely free, and runs on all platforms including mobile phones [https://play.google.com/store/apps/details?id=net.a_z_ia.scadwalk] and the web [http://openscad.net/].
It is easy to make parts that can be reused several times in different ways in the same or other designs, and the possibility for command-line swiches make automated builds possible.
And for the die-hard programmer, OpenSCAD is easy to use with version control systems.

OpenSCAD is unsuited for 3D objects that are ment to be seen rather than "made flesh" - like movies (see e.g. [http://www.youtube.com/watch?v=JE1zgCftocc]) or 3D scenes. This requires a 
whole different set of tools, tools that, on the other hand, often makes 3D shapes that cannot be printed because the geometry turns out to have holes or other problems. 

This workshop will give you experience designing 3D models in OpenSCAD, and preparing them for printing with Cura. It will demonstrate use of the 3D printer that Realfagsbiblioteket has available for lending.

## Tools of the trade
1. Design
  * Ruler, to measure the real world
  * Design software, like OpenSCAD
2. Printing
  * Slicing software, like Cura
  * Knife, to remove finished print from printer 
3. Finishing
  * Knife, to remove supports
  * Plier, also useful to remove  supports
  * File or sand paper to clean prints


Subjects covered:
- Writing OpenSCAD code
- Getting others’ code, sharing your code
- Exporting and importing from STL
- Preparing STLs for printing with Cura
- Printing on Ultimaker 2+ extruder printer

Learning outcomes:
- Able to design models with OpenSCAD
- Able to print models on extruders

[Next slide](02-3D-printing.md)

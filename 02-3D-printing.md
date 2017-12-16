# 3D printing

## The design process

1) You start with an _idea for a thing_ - something you want to make. 
2) You _make a digital model_ of that thing. The digital model can be in any of a number of formats - today we use OpenSCAD.
3) However, an extruder (the type of 3D printer we work with) is really just a hot glue gun controlled by a computer. 
The printer needs specific instructions - how to move the print head and how much material to deposit in each place. 
Hence, a printer comes with a program to make a list of these instructions from your model. These programs all read the STL file format, so you should _export your model to .stl_.
4) You should import your .stl file to the cura program and _make a .cura file_. The Cura file is what you give the printer. 

---
STL (an abbreviation of "stereolithography") is a file format native to the stereolithography CAD software created by 3D Systems
STL files describe only the surface geometry of a three-dimensional object without any representation of color, texture or other common CAD model attributes. 
---

[Next slide](03-basicOpenSCAD.md)

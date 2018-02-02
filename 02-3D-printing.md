# 3D printing

This section is a demo section where I show export to STL, import to Cura, export to Gcode and start a print. 
While doing this I discuss the following, usually based on a failed 3D-print I have brough:

1. [Slicing software variables](#slicing-software-variables)
2. [The environment](#the-environment)
3. [Servicing the printer](#servicing-the-printer)
4. [Model or printing problems](#model-or-printing-problems)

## Slicing software variables

### Raft

A raft attaches your print to the build plate, improves stability and makes sure the bottom layer of your build goes smoothly even if it is irregular in shape. 
Unless I am absolutely sure I don't need to, I always use it.
If your model is well grounded to the build plate but has a complex bottom layer you could consider using only a narrow raft.

### Support

Cura or other slicing software can make printing supports automatically. 
It is really better to design models in such a way that they don't need support, or make the required support yourself as part of designing the model.
However, when that is inconvenient and you need support use the built-in possibility.

### Print head size

0.4mm is the standard size of the printer in the library. 
That's medium big, so prints OK fast and with a medium resolution. 
Print head size can matter when you design small details on your models - a 1.0mm thick wall, for example, will print no different than a 0.8mm thick wall.
A 0.3mm thick wall will not print at all. 
Keep print head size in mind both when designing thin structures or small details, and when resizing finished models in your slicing software!

### Layer height

The thicker the layer, the faster the print.
However, thicker layers also produce less detailed prints.
I almost always use 0.15mm layer height, which is quite thick.

### Infill

Less infill means faster, cheaper prints. 
You can get by with surprisingly little.
Even on high-tension parts like slingshots I never use more than 25%, and I usually go with 5% for non-high-tension parts.

### Shell

Unless you go with 100% infill the thickness of your shell is important.
As always, thinner is faster and cheaper, but too thin gets too flimsy.
I usually use 1mm for high-tension parts (in practice 0.8mm-0.9mm because of print head size and layer height) 
and whatever Cura suggests for other parts (in theory 0.7mm, which in practice means down to 0.4mm).

## The environment

I firmly belive 3D printing can come to have a positive environmental effect on how we make things.
It is easy to make complex, hollow parts (that can use less material and be lighter), personified things should last longer than mass-produced ones, 
and we might avoid shipping raw material and partially finished produts back and forth for manufacture. 
That is not how it is at the moment. 
Some of the problems include:

- Manufacturing energy needs are large.
- We use a lot of material for support and other non-essential parts of builds. This uses excess material and energy. 
- Our plastic is sometimes sourced from non-renewable sources, and never breaks down but ends up as micro particles in our seas.
- Home owned printers are utilised little, leading the manufacturing footprint of the machine to be a large part of the total environmental impact.
- The printing process can make harmful fumes.
- Filament is not food safe but sometimes used for cutlery. Even using food safe filament the printing process produces layered cracks in which bacteria thrive. 

Without belabouring the point, some quick tips:
- PLA bio-plastic is a good filament - it requires little energy to make, and has a low melting point so requires fairly little build energy. 
  It is made from corn starch and is recyclable, biodegradable and compostable. 
  It creates little fumes when printing. 
  PLA in itself is food safe, but colored filament usually isn't! 
  And the cracks for bacteria are still there. 
- Try to design for printing without support, and orient your parts optimally when printing.
- Make hollow parts, and use little infill in massive parts
- Common printers like the one in the library is a good idea environmentally. 
- Depending on print technology, printing several parts at once might cut down on energy use (this is not true for the Library machine).

<https://sustainabilityworkshop.autodesk.com/blog/environmental-impacts-3d-printing> has more on these issues.

## Servicing the printer

This section is specific to [the Ultimaker 2+ printer](https://ultimaker.com/en/products/ultimaker-2-plus) the library currently has. 

### Changing colour
You start the filament changing process by selecting it in the menu. 
It is very easy, but also documented on
<https://ultimaker.com/en/resources/21476-how-to-insert-filament>
It is important that the new filament is undamaged!
Damaged filament can break off and get stuck in the feed tube. 
This is easy but time comsuming to fix. 

### Printer problems
<https://ultimaker.com/en/resources/18767-unboxing> has a "troubleshooter" section. 
However, talk to the library if you have serious issues. 

## Model or printing problems
Designing models is an iterative process.
You often go several rounds with test prints before you are happy with what you have made. 

### Lack of support
Several models either require you to design supports, or make use of in-built support functions in the slicing software. 
A lack of sufficient supports usually botches the print. 

### Thin walls and delicate parts
Frequently, unanticipated problems stem from too delicate parts not attuned to print head size.
If your walls are thinner than your print head they will not print. 
And if they _just_ print they might be too thin for stability.
Design more durable parts, change print head size or get access to another printer :-)

### Several simultaneous builds
Imagine you print two spires side by side.
As the print head travels back and forth between them it will be trailed by remains of filament, making the build less accurate.
Additionally, if one fails (e.g. because the raft fails to attach the print to the build plate) it will usually cause the other one to fail as well.
Though it takes more time it is usually better to print one part at a time. 

### Gcode errors
I have had Cura turn fine STL files into Gcode files where some of the layers are skewed on a couple of occasions.
If that happens, simply make a new Gcode in exactly the same way.
Chances are, the next file will be fine.

[Previous slide](01-intro.md)
[Next slide](03-basicOpenSCAD.md)

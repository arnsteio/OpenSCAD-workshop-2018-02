# My hamster will die!!! - OpenSCAD modules

One of the clips keeping my hamster cage together has broken. If my hamster escapes, the neighbour's cat will eat him. 
Let's build a pet cage clip!

~~~
cube([60, 10, 15], center=false);
cube([10, 60, 15], center=false);
~~~
Or, we can do
~~~
cube([60, 10, 15], center=false);
translate([60, 0, 0]) rotate([0,0,90]) cube([60, 10, 15], center=false);
~~~
which does the same in a different way. 
Things are going swell, however fate - in the guise of your friend Kari - intervenes with a phone call:

>*- Hi, are you still making that pet cage clip for your hamster?*
>
> Yeah...?
>
>*- My 6-sided bird cage broke. Could you print a clip for me, too?*
>
> Uh, OK, sure, but I need some measurements?
>
>*- Each segment is 5cm long, 1cm wide and 15mm tall. The slot for the bars is 4mm wide and 6mm deep.*
>
> OK, I'll bring it to Uni on friday :-)

So we need to make a more generic solution. 
Let's start by defining what we know:

~~~
/* [Global] */ 
clip_length=50;
clip_width=10;
clip_height=15;
clip_angle=60;

//bar_width=4;
//bar_insertion_depth=6;

	cube([clip_length,clip_width, clip_height], center=false);
	translate([clip_length, 0, 0]) rotate([0,0,clip_angle]) cube([clip_length,clip_width,clip_height], center=false);
~~~

This works, and is pretty generic. But we need to make the cutout for the bar, and reusing that code would be perfect. We make a _module_ out of the code we have:

~~~
/* [Global] */ 
clip_length=50;
clip_width=10;
clip_height=15;
clip_angle=60;

// bar_width=4;
// bar_insertion_depth=6;

module angle(length, width, height, angle)
    {
	cube([length, width, height], center=false);
	translate([length, 0, 0]) rotate([0,0,angle]) cube([length, width, height], center=false);
    }

angle(clip_length, clip_width, clip_height, clip_angle);
~~~

We can now reuse the code to make the cutout. 
We make a "build module" to call our original module twice, with different measurements. 
Again, we'll make parts of the design transparent by putting a "%" in front of parts we want to be transparent:

~~~
/* [Global] */
clip_length=50;
clip_width=10;
clip_height=15;
clip_angle=60;

bar_width=4;
bar_insertion_depth=6;

module angle(length, width, height, angle)
    {
        cube([length, width, height], center=false);
        translate([length, 0, 0]) rotate([0,0,angle]) cube([length, width, height], center=false);
    }

module clip()
    {
        difference()
            {
            %angle(clip_length, clip_width, clip_height, clip_angle);
            angle(clip_length, bar_width, bar_insertion_depth, clip_angle);
            }
    }
        
clip();
~~~

That's a great beginning, almost finished in fact! Let's now move the cutout to the correct position:

~~~
/* [Global] */
clip_length=50;
clip_width=10;
clip_height=15;
clip_angle=60;

bar_width=4;
bar_insertion_depth=6;

module angle(length, width, height, angle)
    {
        cube([length, width, height], center=false);
        translate([length, 0, 0]) rotate([0,0,angle]) cube([length, width, height], center=false);
    }

module clip()
    {
        difference()
            {
            %angle(clip_length, clip_width, clip_height, clip_angle);
            translate([0,(clip_width/2)-(bar_width/2),0]) angle(clip_length, bar_width, bar_insertion_depth, clip_angle);
            }
    }
        
clip();
~~~

Uh - that works for the Y axis, bit the X axis is off. 
To fix this we can do one of three things:

1. Try several numbers to find one that works. Nothing wrong with that, although the solution will not be generic.
2. Design the clip in a way that works around that problem. That's absolutely doable.
3. Do some trigonometry to make a generic solution that works without a redesign. 

We will follow possibility 3 :-)

[Next slide](05-trigonometry_conditionals_loops.md)

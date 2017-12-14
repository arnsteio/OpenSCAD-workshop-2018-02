# My hamster will die!!!

One of the clips keeping my hamster cage together has broken. If my hamster escapes, the neighbour's cat will eat him. 
Let's build a pet cage clip!

~~~
cube([100, 10, 15], center=false);
cube([10, 100, 15], center=false);
~~~

~~~
cube([100, 10, 15], center=false);
translate([100, 0, 0]) rotate([0,0,90]) cube([100, 10, 15], center=false);
~~~

Things are going swell, however fate - in the guise of your friend Kari - intervenes:

* Hi, are you still making that pet cage clip for your hamster?*

> Yeah...?

* My 6-sided bird cage broke. Could you print a clip for me, too?*

> Sure, but I need some measurements...

* Each segment is 5cm long, 1cm wide and 15mm tall. The slot for the bars is 4mm wide and 6mm deep.*

> I'll bring it to Uni on friday :-)

So we'll make a more generic solution. Let's start by defining what we know:

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

This works, and is pretty generic. But we need to make the bar cutout, and reusing that code would be perfect:

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

We can now reuse the code to make the cutout:

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
            translate([]) angle(clip_length, bar_width, bar_insertion_depth, clip_angle);
            }
        }
        
clip();
~~~

~~~
Some later segment introduce
/* [Hidden] */ 
error = 0.01; // To avoid non-overlapping objects
$fn=50;
~~~





[Next slide](05-trigonometry.md)

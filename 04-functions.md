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

~~~
/* [Global] */ 
clip_length=100;
clip_width=10;
clip_height=15;
clip_angle=60;
bar_width=4;
bar_insertion_depth=6;

/* [Hidden] */ 
error = 0.01; // To avoid non-overlapping objects
$fn=50;

module angle(a_length, a_width, a_height, a_angle)
    {
	cube([a_length,a_width,a_height], center=false);
	translate([a_length, 0, 0]) rotate([0,0,a_angle]) cube([a_length,a_width,a_height], center=false);
    }
~~~




[Next slide](05-trigonometry.md)

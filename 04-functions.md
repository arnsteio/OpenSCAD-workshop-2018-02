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


[Next slide](05-trigonometry.md)

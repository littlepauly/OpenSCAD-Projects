use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

hole_side = 3;
hole_depth = 9;
hole_ff = 1.05;


pin_length = 30;
pin_r1 = 3;
pin_r2 = 1.5;


difference(){

union(){

// arm
cylinder( r1 = pin_r1, r2 = pin_r2, h = pin_length, center=true);

// ball
translate( [ 0, 0, 0.5*pin_length]){ sphere( r = pin_r1);}

}

// broach

translate( [ 0, 0, -0.5*pin_length + 0.5*hole_depth]){ cube( [ hole_ff*hole_side, hole_ff*hole_side, hole_ff*hole_depth], center=true);}

}
use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

pin_spacing = 1.01*(20 + 5);
pin_radius = 1.5;
pin_height = 1.5;

difference(){

union(){
cube( [ 35, 6, 2], center=true);
translate( [ 0.5*pin_spacing, 0, 0.5*pin_height + 1]){cylinder( r = 2*pin_radius, h = pin_height, center=true);}
}

union(){
translate( [ 0.5*pin_spacing, 0, 0]){cylinder( r = pin_radius, h = 10, center=true);}
translate( [ -0.5*pin_spacing, 0, 0]){cylinder( r = pin_radius, h = 10, center=true);}

}

}

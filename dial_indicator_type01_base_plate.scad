use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm


pin_spacing = 1.01*(20 + 5);
pin_radius = 1.5;
pin_height = 1.5;

dial_radius = 30;

plate_thick = 1.5;

// plate
cylinder( r = dial_radius, h = plate_thick, center=true);

// pinion pin
translate([ 0, 0, 0.5*(pin_height + plate_thick)]){cylinder( r = 0.95*pin_radius, h = pin_height, center=true);}

// arm pin
translate([ 0, pin_spacing, 0.5*(3*pin_height + plate_thick)]){cylinder( r = 0.95*pin_radius, h = 3*pin_height, center=true);}

// spring holders

difference(){
translate([ 3, -10, 0.5*(3*pin_height + plate_thick)]){ cylinder( r = 1.5*pin_radius, h = 3*pin_height, center=true);}
translate([ 3, -10, 2*pin_height + 0.5*plate_thick]){ rotate([ 90, 0, 0]){
   cylinder( r = 0.5, h = 10, center=true);
}
}
}

difference(){
translate([ -3, -10, 0.5*(3*pin_height + plate_thick)]){cylinder( r = 1.5*pin_radius, h = 3*pin_height, center=true);}
translate([ -3, -10, 2*pin_height + 0.5*plate_thick]){ rotate([ 90, 0, 0]){
   cylinder( r = 0.5, h = 10, center=true);
}
}
}
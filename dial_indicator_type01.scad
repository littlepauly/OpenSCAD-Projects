use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

pin_spacing = 1.01*(20 + 5);
pin_radius = 1.5;
pin_height = 1.5;

difference(){

union(){

// Teeth
gear_generator( 90, PI/2, 3, 1.5);

// Mount
translate([-15,0,2.5]){cube( [ 5, 10, 2] ,center=true);}
}

union(){

translate([20,0,0]){cube([ 10, 10, 10], center=true);}

translate([3,1.05,0]){
rotate_extrude(angle=157){ 
translate([15,0,0]){
square([30,10], center=true);
}
}
}

translate([3,-1.05,0]){
rotate_extrude(angle=-157){ 
translate([15,0,0]){
square([30,10], center=true);
}
}
}
// Holes for springs/needles


translate([ -15, 3, 2.5]){ rotate([ 0, 90, 0]){ cylinder( r = 0.5, h = 10, center=true);}}
translate([ -15, -3, 2.5]){ rotate([ 0, 90, 0]){ cylinder( r = 0.5, h = 10, center=true);}}

}
}
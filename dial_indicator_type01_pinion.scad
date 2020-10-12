use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm

difference(){

union(){
gear_generator( 10, PI/2, 3, 1.5);
translate([0,0,2]){cylinder( r = 3, h = 2, center=true);}
translate([0,0,5]){cylinder( r = 1.5, h = 5, center=true);}
}

//pinhole

translate([0,0,6]){
   rotate([90,0,0]){
      cylinder( r = 0.5, h = 10, center=true);
}
}
}
use <functions.scad>

  $fa=.1; // default minimum facet angle is now 0.5
  $fs=.1; // default minimum facet size is now 0.5 mm


r=3;
l=14;

// shape to be extruded
union() {
// radius
for( i=[0,1]) {

translate( [ 0, i*l-0.5*l, 0] ) {
rotate_extrude( angle = -90+i*180 ) {
translate( [ r-0.5*r, 0, 0] ) {square( [r, 1], center=true);}
}
}
}

translate( [ r-0.5*r, 0, 0] ) {cube([ r, l, 1], center=true);}

}
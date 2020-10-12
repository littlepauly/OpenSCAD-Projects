// Extrution section eith rounded corners

use <functions.scad>

$fa=.1; // default minimum facet angle is now 0.5
$fs=.1; // default minimum facet size is now 0.5 mm

round_edge_extrusion( 4, 10);

//cor_rad = 3;
//tot_dep = 10;
//
//dep = tot_dep - 2*cor_rad;
//offset = 0.5*dep;
//
//
//// shape to be extruded
//union() {
//// radius
//for( i=[0,1]) {
//
//translate( [ 0, cos(180*i)*offset, 0] ) {
//rotate_extrude( angle = 90-i*180 ) {
//translate( [ cor_rad-0.5*cor_rad, 0, 0] ) {square( [cor_rad, 1], center=true);}
//}
//}
//}
//
//translate( [ cor_rad-0.5*cor_rad, 0, 0] ) {cube([ cor_rad, dep, 1], center=true);}
//
//}


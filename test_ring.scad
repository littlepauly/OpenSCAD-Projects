// Extrution section eith rounded corners

use <functions.scad>

$fa=.5; // default minimum facet angle is now 0.5 deg
$fs=.5; // default minimum facet size is now 0.5 mm

rad = 22;
cor_rad = 1.5;
dep = 10;

rotate_extrude(angle = 360){
translate([ rad+cor_rad, 0 ,0]){

// Cross Section
projection(){
union(){
for(i=[0,1]){
rotate([ 0, 0, 180*i]){
round_edge_extrusion( cor_rad, dep);
}
}
}
}
}
}
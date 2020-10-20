use <functions.scad>

$fa=.5; // default minimum facet angle is now 0.5
$fs=.5; // default minimum facet size is now 0.5 mm

union(){
difference() {

union(){
translate([ 0, 0, 0] ) { import("/exports/bike_bottle_holder/Bottle_cage.stl", convexity=10);}

translate([ 0, -44, 5] ) {rect_round( 42, 25, 10, 1.5); }
}

union(){
translate([ 0, -49.4, 5] ) { cube( [ 36, 20, 11], center=true);} 

for(i=[0:1]){
translate([ 0, 3.7, 18]){
rotate([ 0, 0, i*92+41]) {
rotate_extrude(angle = 6){
translate([ 37, 0 , 0]){
projection(){
union(){
round_edge_extrusion( 2.2, 25);
rotate([0,0,180]){round_edge_extrusion( 2.2, 25);}
}
}
}
}
}
}
}
}
}



for(i=[0:1]){
translate([ 0, 3.7, 13]){
rotate([ 0, 0, i*104+35]) {
rotate_extrude(angle = 6){
translate([ 37, 0 , 0]){
projection(){
union(){
round_edge_extrusion( 2, 25);
rotate([0,0,180]){round_edge_extrusion( 2, 25);}
}
}
}
}
}
}
}
}